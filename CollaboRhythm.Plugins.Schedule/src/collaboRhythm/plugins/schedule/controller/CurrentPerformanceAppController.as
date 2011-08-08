/**
 * Copyright 2011 John Moore, Scott Gilroy
 *
 * This file is part of CollaboRhythm.
 *
 * CollaboRhythm is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later
 * version.
 *
 * CollaboRhythm is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with CollaboRhythm.  If not, see
 * <http://www.gnu.org/licenses/>.
 */
package collaboRhythm.plugins.schedule.controller
{

	import collaboRhythm.plugins.schedule.model.ScheduleModel;
	import collaboRhythm.plugins.schedule.model.ScheduleModelEvent;
	import collaboRhythm.plugins.schedule.shared.model.PendingAdherenceItem;
	import collaboRhythm.plugins.schedule.view.CurrentPerformanceWidgetView;
	import collaboRhythm.plugins.schedule.view.IScheduleFullView;
	import collaboRhythm.plugins.schedule.view.ScheduleClockWidgetView;
	import collaboRhythm.plugins.schedule.view.ScheduleReportingFullView;
	import collaboRhythm.plugins.schedule.view.ScheduleTimelineFullView;
	import collaboRhythm.shared.controller.apps.AppControllerConstructorParams;
	import collaboRhythm.shared.controller.apps.AppEvent;
	import collaboRhythm.shared.controller.apps.WorkstationAppControllerBase;

	import flash.desktop.NativeApplication;
	import flash.events.InvokeEvent;
	import flash.net.URLVariables;

	import mx.core.UIComponent;

	public class CurrentPerformanceAppController extends WorkstationAppControllerBase
	{
		public static const DEFAULT_NAME:String = "CurrentPerformance";

		private var _scheduleModel:ScheduleModel;

		private var _widgetView:CurrentPerformanceWidgetView;

		public function CurrentPerformanceAppController(constructorParams:AppControllerConstructorParams)
		{
			super(constructorParams);
		}

		override public function initialize():void
		{
			super.initialize();
		}

		override protected function createWidgetView():UIComponent
		{
			_widgetView = new CurrentPerformanceWidgetView();
			return _widgetView;
		}

		override public function reloadUserData():void
		{
			removeUserData();

			super.reloadUserData();
		}

		override protected function updateWidgetViewModel():void
		{
			super.updateWidgetViewModel();

			if (_widgetView && _activeRecordAccount)
			{
				_widgetView.init(this, scheduleModel);
			}
		}

		public override function get defaultName():String
		{
			return DEFAULT_NAME;
		}

		override public function get widgetView():UIComponent
		{
			return _widgetView;
		}

		override public function set widgetView(value:UIComponent):void
		{
			_widgetView = value as CurrentPerformanceWidgetView;
		}

		override public function get isFullViewSupported():Boolean
		{
			return false;
		}

		override protected function get shouldShowFullViewOnWidgetClick():Boolean
		{
			return false;
		}

		private function get scheduleModel():ScheduleModel
		{
			if (!_scheduleModel)
			{
				_scheduleModel = _activeRecordAccount.primaryRecord.getAppData(ScheduleModel.SCHEDULE_MODEL_KEY, ScheduleModel) as ScheduleModel;
			}
			return _scheduleModel;
		}

		protected override function removeUserData():void
		{
			_scheduleModel = null;
		}
	}
}
