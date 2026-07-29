import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure RandomizedControlledTrialPackage where
  randomizationProtocol : Prop
  blindingMethod : Prop
  sampleSizeCalculation : Prop
  primaryEndpoint : Prop
  statisticalAnalysisPlan : Prop
  efficacyEstimate : Prop

structure RandomizedControlledTrialEvidence (R : RandomizedControlledTrialPackage) where
  randomizationProtocolClosed : R.randomizationProtocol
  blindingMethodClosed : R.blindingMethod
  sampleSizeCalculationClosed : R.sampleSizeCalculation
  primaryEndpointClosed : R.primaryEndpoint
  statisticalAnalysisPlanClosed : R.statisticalAnalysisPlan
  efficacyEstimateClosed : R.efficacyEstimate

def RandomizedControlledTrialClosed (R : RandomizedControlledTrialPackage) : Prop :=
  R.randomizationProtocol ∧ R.blindingMethod ∧
  R.sampleSizeCalculation ∧ R.primaryEndpoint ∧
  R.statisticalAnalysisPlan ∧ R.efficacyEstimate

theorem randomized_controlled_trial_closed_from_evidence
    (R : RandomizedControlledTrialPackage) (E : RandomizedControlledTrialEvidence R) :
    RandomizedControlledTrialClosed R := by
  exact And.intro E.randomizationProtocolClosed
    (And.intro E.blindingMethodClosed
      (And.intro E.sampleSizeCalculationClosed
        (And.intro E.primaryEndpointClosed
          (And.intro E.statisticalAnalysisPlanClosed E.efficacyEstimateClosed))))

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse