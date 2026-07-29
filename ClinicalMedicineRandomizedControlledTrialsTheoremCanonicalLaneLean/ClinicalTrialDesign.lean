import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  population : Type u
  treatmentArm : Type v
  controlArm : Type w
  randomizationProtocol : Prop
  blindingProcedure : Prop
  sampleSizeDetermination : Prop
  outcomeMeasure : Prop

structure ClinicalTrialDesignEvidence (D : ClinicalTrialDesignPackage) where
  randomizationProtocolClosed : D.randomizationProtocol
  blindingProcedureClosed : D.blindingProcedure
  sampleSizeDeterminationClosed : D.sampleSizeDetermination
  outcomeMeasureClosed : D.outcomeMeasure

def ClinicalTrialDesignClosed (D : ClinicalTrialDesignPackage) : Prop :=
  D.randomizationProtocol ∧ D.blindingProcedure ∧
  D.sampleSizeDetermination ∧ D.outcomeMeasure

theorem clinical_trial_design_closed_from_evidence (D : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence D) :
    ClinicalTrialDesignClosed D := by
  exact And.intro E.randomizationProtocolClosed
    (And.intro E.blindingProcedureClosed
      (And.intro E.sampleSizeDeterminationClosed E.outcomeMeasureClosed))

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse