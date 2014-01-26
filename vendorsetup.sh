#
# Copyright (C) 2011 The Android Open Source Project
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

# Run device patches on the tree.
# in terminal: export PATCHES_HUAWEI_U8951=1 to run
if [[ "$PATCHES_HUAWEI_U8951" -eq 1 ]]
then
  # apply Yamato patches
  export YAMATO_PATCH_SOURCE=1
  echo ""
  echo "***************** HUAWEI U8951 *****************"
  echo ""
  sh device/huawei/u8951/patches/apply.sh
  echo ""
  echo "***************** HUAWEI U8951 *****************"
  echo ""
fi
