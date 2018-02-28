Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 809BE788CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 16:23:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 08:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="204421829"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Feb 2018 08:23:45 -0800
To: =?UTF-8?Q?M=c3=a5ns_Zigher?= <mans.zigher@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
	<CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
	<CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
	<CAEhQi8kJsaGWaHSTB9mwWSCJ+wCSGEpDXb3V6SWeCLmT56zCwA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2bb3d54e-cbee-a3f9-6608-9650c7fbe87a@linux.intel.com>
Date: Wed, 28 Feb 2018 18:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAEhQi8kJsaGWaHSTB9mwWSCJ+wCSGEpDXb3V6SWeCLmT56zCwA@mail.gmail.com>
Subject: Re: [meta-qt4] Cmake Could NOT find Qt4, missing: QT_MOC_EXECUTABLE
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
X-List-Received-Date: Wed, 28 Feb 2018 16:23:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/22/2018 01:04 PM, Måns Zigher wrote:
> This solved my problem I still couldn't figure out if the qt4-native is
> actually broken or if this is the way it should work now that each recipe
> have it's own sysroot.

Do you have a Qt5 transition plan? meta-qt4 is not maintained or tested 
regularly anymore, as there is no upstream support. If it breaks, 
patches welcome.

Alex

