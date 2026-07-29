import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure SurvivalData where
  eventTimes : List ℝ
  censoringIndicator : List Bool
  estimate : ℝ → ℝ
  estimateValid : Prop

structure KaplanMeierSurvivalEvidence (S : SurvivalData) where
  estimateValidClosed : S.estimateValid

def KaplanMeierSurvivalClosed (S : SurvivalData) : Prop :=
  S.estimateValid

theorem kaplan_meier_survival_closed_from_evidence
    (S : SurvivalData) (E : KaplanMeierSurvivalEvidence S) :
    KaplanMeierSurvivalClosed S :=
  E.estimateValidClosed

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse