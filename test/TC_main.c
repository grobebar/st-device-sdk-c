/* ***************************************************************************
 *
 * Copyright 2020 Samsung Electronics All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 *
 ****************************************************************************/
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include "TCs.h"

int main(void) {
    const struct CMUnitTest tests[] = {
            cmocka_unit_test(TC_iot_util_get_random_uuid),
            cmocka_unit_test(TC_iot_util_convert_str_mac),
            cmocka_unit_test(TC_iot_api_device_info_load_null_parameters),
            cmocka_unit_test(TC_iot_api_device_info_load_success),
            cmocka_unit_test(TC_iot_api_onboarding_config_load_null_parameters),
            cmocka_unit_test(TC_iot_api_onboarding_config_load_template_parameters),
            cmocka_unit_test(TC_iot_api_onboarding_config_load_success),
            cmocka_unit_test(TC_iot_uuid_from_mac),
            cmocka_unit_test(TC_iot_uuid_from_mac_internal_failure),
            cmocka_unit_test(TC_iot_random_uuid_from_mac),
            cmocka_unit_test(TC_iot_ramdom_uuid_from_mac_internal_failure),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_int_null_attribute, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_int_null_unit, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_int_with_unit, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_int_internal_failure, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_number_null_attribute, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_number_null_unit, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_number_with_unit, TC_iot_capability_teardown),
            cmocka_unit_test_teardown(TC_st_cap_attr_create_number_internal_failure, TC_iot_capability_teardown),
            cmocka_unit_test(TC_iot_crypto_pk_init_null_parameter),
            cmocka_unit_test(TC_iot_crypto_pk_init_ed25519),
            cmocka_unit_test_setup_teardown(TC_iot_nv_get_root_certificate_success, TC_iot_nv_data_setup, TC_iot_nv_data_teardown),
            cmocka_unit_test_setup_teardown(TC_iot_nv_get_root_certificate_null_parameters, TC_iot_nv_data_setup, TC_iot_nv_data_teardown),
            cmocka_unit_test_setup_teardown(TC_iot_nv_get_root_certificate_internal_failure, TC_iot_nv_data_setup, TC_iot_nv_data_teardown),
            cmocka_unit_test_setup_teardown(TC_iot_nv_get_public_key_success, TC_iot_nv_data_setup, TC_iot_nv_data_teardown),
            cmocka_unit_test_setup_teardown(TC_iot_nv_get_public_key_null_parameters, TC_iot_nv_data_setup, TC_iot_nv_data_teardown),
            cmocka_unit_test(TC_iot_easysetup_create_ssid_null_parameters),
            cmocka_unit_test_setup_teardown(TC_iot_easysetup_create_ssid_success, TC_iot_easysetup_create_ssid_setup, TC_iot_easysetup_create_ssid_teardown),
            cmocka_unit_test(TC_iot_easysetup_request_handler_null_parameters),
    };
    return cmocka_run_group_tests(tests, NULL, NULL);
}