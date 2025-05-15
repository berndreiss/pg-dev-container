//extern "C" __attribute__((visibility("default"))) char CLANG_ANALYZER_API_VERSION_STRING[] = "20.0.0git";
//extern "C" char CLANG_ANALYZER_API_VERSION_STRING[] = "20.0.0git";
//#define CLANG_ANALYZER_API_VERSION_STRING "20.0.0git"

#include <optional>

#include "clang/StaticAnalyzer/Core/Checker.h"
#include "clang/StaticAnalyzer/Core/BugReporter/BugReporter.h"
#include "clang/StaticAnalyzer/Frontend/CheckerRegistry.h"
#include "clang/StaticAnalyzer/Core/BugReporter/BugType.h"
#include "clang/StaticAnalyzer/Core/PathSensitive/CheckerContext.h"
#include "clang/StaticAnalyzer/Core/PathSensitive/CallEvent.h"


using namespace clang;
using namespace ento;

namespace {
class MyChecker : public Checker<check::PreCall> {
  mutable std::unique_ptr<BugType> BT;

public:
  void checkPreCall(const CallEvent &Call, CheckerContext &C) const {
    llvm::errs() << "CHECKING PRE CALL\n";
    if (Call.getCalleeIdentifier() &&
        Call.getCalleeIdentifier()->getName() == "pfree") {
      if (Call.getNumArgs() >= 2) {
        SVal arg = Call.getArgSVal(1);
        std::optional<nonloc::ConcreteInt> CI = arg.getAs<nonloc::ConcreteInt>();
        if (!CI) {
          if (!BT)
            BT.reset(new BugType(this, "Non-constant arg", "MyChecker"));
          ExplodedNode *N = C.generateErrorNode();
          if (!N) return;
          auto R = std::make_unique<PathSensitiveBugReport>(*BT, "Second arg is not constant", N);
          C.emitReport(std::move(R));
        }
        else{
          llvm::errs() << CI.value() <<"\n";
        }
      }
    }
  }
};
} // namespace

extern "C" void clang_registerCheckers(CheckerRegistry &registry) {
  registry.addChecker<MyChecker>(
    "postgres.MyChecker", "Warn when second argument to pfree isn't constant", "");
}

