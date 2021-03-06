package collaboRhythm.plugins.insulinTitrationSupport.model
{
	import collaboRhythm.plugins.insulinTitrationSupport.controller.InsulinTitrationSupportHealthActionInputController;
	import collaboRhythm.plugins.insulinTitrationSupport.controller.TitratingInsulinHealthActionInputController;
	import collaboRhythm.plugins.schedule.shared.model.HealthActionBase;
	import collaboRhythm.plugins.schedule.shared.model.IHealthActionInputController;
	import collaboRhythm.plugins.schedule.shared.model.IHealthActionInputControllerFactory;
	import collaboRhythm.plugins.schedule.shared.model.IHealthActionModelDetailsProvider;
	import collaboRhythm.plugins.schedule.shared.model.IScheduleCollectionsProvider;
	import collaboRhythm.plugins.schedule.shared.model.MedicationHealthAction;
	import collaboRhythm.shared.model.ICollaborationLobbyNetConnectionServiceProxy;
	import collaboRhythm.shared.model.healthRecord.document.ScheduleItemOccurrence;

	import flash.net.URLVariables;

	import spark.components.ViewNavigator;

	public class InsulinTitrationSupportHealthActionInputControllerFactory implements IHealthActionInputControllerFactory
	{
		public function InsulinTitrationSupportHealthActionInputControllerFactory()
		{
		}

		public function createHealthActionInputController(healthAction:HealthActionBase,
														  scheduleItemOccurrence:ScheduleItemOccurrence,
														  healthActionModelDetailsProvider:IHealthActionModelDetailsProvider,
														  scheduleCollectionsProvider:IScheduleCollectionsProvider,
														  viewNavigator:ViewNavigator,
														  currentHealthActionInputController:IHealthActionInputController,
														  collaborationLobbyNetConnectionServiceProxy:ICollaborationLobbyNetConnectionServiceProxy):IHealthActionInputController
		{
			if (healthAction.type == InsulinTitrationSupportHealthAction.HEALTH_ACTION_TYPE)
			{
				return new InsulinTitrationSupportHealthActionInputController(scheduleItemOccurrence,
						healthActionModelDetailsProvider, viewNavigator, collaborationLobbyNetConnectionServiceProxy);
			}
			else if (healthAction.type == MedicationHealthAction.TYPE )
			{
				var medicationHealthAction:MedicationHealthAction = healthAction as MedicationHealthAction;
				if (medicationHealthAction && InsulinTitrationSupportChartModifier.INSULIN_MEDICATION_CODES.indexOf(medicationHealthAction.medicationCode) != -1)
				{
					return new TitratingInsulinHealthActionInputController(scheduleItemOccurrence,
							healthActionModelDetailsProvider, viewNavigator, collaborationLobbyNetConnectionServiceProxy, currentHealthActionInputController);
				}
			}
			return currentHealthActionInputController;
		}

		public function createDeviceHealthActionInputController(urlVariables:URLVariables,
																healthActionModelDetailsProvider:IHealthActionModelDetailsProvider,
																scheduleCollectionsProvider:IScheduleCollectionsProvider,
																viewNavigator:ViewNavigator,
																currentDeviceHealthActionInputController:IHealthActionInputController):IHealthActionInputController
		{
			return currentDeviceHealthActionInputController;
		}
	}
}
