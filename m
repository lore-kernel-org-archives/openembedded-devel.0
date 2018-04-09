Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF637522C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 06:31:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 23:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="41804879"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Apr 2018 23:31:51 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
	<1523203076-7314-2-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c71f2d16-4f1a-c26d-9b4c-6f2930a95dc1@linux.intel.com>
Date: Mon, 9 Apr 2018 09:25:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523203076-7314-2-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][v2][PATCH 2/2] mongodb: refresh patches and remove un-needed patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 06:31:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 06:57 PM, Armin Kuster wrote:
> [V2]
> remove patch, changes upstream
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   ...to-use-build-settings-from-environment-va.patch | 37 +++++++++----------
>   .../0001-Use-long-long-instead-of-int64_t.patch    | 21 +++++------
>   .../mongodb/0001-mongo-Add-using-std-string.patch  | 43 ++++++++++------------
>   ...-Add-missing-dependenncy-on-local_shardin.patch | 11 ++----
>   meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |  1 -
>   5 files changed, 50 insertions(+), 63 deletions(-)

Which patch is being removed?

Alex

