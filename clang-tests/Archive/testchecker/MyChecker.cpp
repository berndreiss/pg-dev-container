#include "clang/StaticAnalyzer/Core/Checker.h"
#include "clang/StaticAnalyzer/Core/CheckerManager.h"
#include "clang/StaticAnalyzer/Core/PathSensitive/CheckerContext.h"
#include "clang/StaticAnalyzer/Core/BugReporter/BugType.h"
#include "clang/StaticAnalyzer/Frontend/CheckerRegistry.h"

using namespace clang;
using namespace ento;

namespace {
class MyChecker : public Checker<check::PreStmt<IfStmt>> {
  mutable std::unique_ptr<BugType> BT;
public:
  void checkPreStmt(const IfStmt *IS, CheckerContext &C) const {
    if (!BT)
      BT.reset(new BugType(this, "If statement found", "MyChecker"));

    ExplodedNode *N = C.generateNonFatalErrorNode();
    if (!N) return;

    auto R = std::make_unique<PathSensitiveBugReport>(*BT, "Found an if statement", N);
    C.emitReport(std::move(R));
  }
};
}

extern "C" __attribute__((visibility("default")))
void clang_registerCheckers(CheckerRegistry &registry) {
  registry.addChecker<MyChecker>("example.MyChecker", "Flags all if statements", "");
}

extern "C" __attribute__((visibility("default")))
const char* clang_analyzerAPIVersionString() {
  static const char Version[] = "19.1.7";
  return Version;
}



