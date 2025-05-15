// MyChecker.cpp
#include "clang/StaticAnalyzer/Core/Checker.h"
#include "clang/StaticAnalyzer/Core/CheckerManager.h"
#include "clang/StaticAnalyzer/Core/BugReporter/BugType.h"
#include "clang/StaticAnalyzer/Core/PathSensitive/CheckerContext.h"

using namespace clang;
using namespace ento;

namespace {
class MyChecker : public Checker<check::PreStmt<ReturnStmt>> {
  std::unique_ptr<BugType> BT;

public:
  void checkPreStmt(const ReturnStmt *RS, CheckerContext &C) const {
    if (!BT)
      BT = std::make_unique<BugType>(this, "Return checker", "MyCheckers");

    if (!RS->getRetValue()) {
      ExplodedNode *N = C.generateNonFatalErrorNode();
      if (!N) return;

      auto R = std::make_unique<PathSensitiveBugReport>(*BT, "Empty return", N);
      C.emitReport(std::move(R));
    }
  }
};
} // namespace

extern "C" void clang_registerCheckers(CheckerRegistry &registry) {
  registry.addChecker<MyChecker>(
    "example.MyChecker",
    "Reports empty return statements",
    "");
}

