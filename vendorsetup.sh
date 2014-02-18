#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Interactive :)
PATCHES_HUAWEI_U8951="n"
echo -n "Apply patches for Huawei u8951? (y/n): " && read PATCHES_HUAWEI_U8951

if [[ "$PATCHES_HUAWEI_U8951" == "y" ]]
then
  export THETA_PATCH_SOURCE=1
  export PATCHES_HUAWEI_U8951=0
  echo ""
  echo "***************** HUAWEI U8951 *****************"
  echo ""
  sh device/huawei/msm7x27a/patches/apply.sh
  sh device/huawei/u8951/patches/apply.sh
  echo ""
  echo "***************** HUAWEI U8951 *****************"
  echo ""
fi
