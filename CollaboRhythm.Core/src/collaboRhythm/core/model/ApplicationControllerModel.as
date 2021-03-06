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
package collaboRhythm.core.model
{
	[Bindable]
    public class ApplicationControllerModel
    {
        public static const CREATE_SESSION_STATUS_ATTEMPTING:String = "Logging in to health record";
        public static const CREATE_SESSION_STATUS_SUCCEEDED:String = "Logged in to health record successfully";
        public static const CREATE_SESSION_STATUS_FAILED:String = "Failed to log into health record - check internet connection";

        private var _createSessionStatus:String;
		private var _isLoading:Boolean;
		private var _hasErrors:Boolean;
		private var _errorMessage:String;

		public function ApplicationControllerModel()
        {
        }

        public function get createSessionStatus():String
        {
            return _createSessionStatus;
        }

        public function set createSessionStatus(value:String):void
        {
            _createSessionStatus = value;
        }

		public function get isLoading():Boolean
		{
			return _isLoading;
		}

		public function set isLoading(value:Boolean):void
		{
			_isLoading = value;
		}

		public function get hasErrors():Boolean
		{
			return _hasErrors;
		}

		public function set hasErrors(value:Boolean):void
		{
			_hasErrors = value;
		}

		public function get errorMessage():String
		{
			return _errorMessage;
		}

		public function set errorMessage(value:String):void
		{
			_errorMessage = value;
		}
	}
}
