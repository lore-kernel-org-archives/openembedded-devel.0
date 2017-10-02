Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 941FE71D79
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 19:41:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 12:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,470,1500966000"; d="scan'208";a="905978820"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2017 12:40:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 03 Oct 2017 08:40:54 +1300
Message-ID: <125583907.4MVqy9ZuDC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAMKF1sqJtK__NUqMuSE-x7Fs508GzvOkK8-JeixbnCF5Z=dyAA@mail.gmail.com>
References: <cover.1506424098.git.paul.eggleton@linux.intel.com>
	<3a6a9b85a7b6eb726bf8a5cf9d79bfc84745a776.1506424098.git.paul.eggleton@linux.intel.com>
	<CAMKF1sqJtK__NUqMuSE-x7Fs508GzvOkK8-JeixbnCF5Z=dyAA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Mon, 02 Oct 2017 19:41:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Khem,

On Tuesday, 3 October 2017 7:21:49 AM NZDT Khem Raj wrote:
> This is not supported on mips e.g.
> 
> | -- INFO - libmraa Version v1.7.0
> | -- INFO - cmake Version 3.8.2
> | -- INFO - Target arch is unknown
> | CMake Error at CMakeLists.txt:173 (message):
> |   Only x86, arm, PERIPHERALMAN and mock platforms currently supported
> |
> 
> Please limit the supported hosts to arm and x86

Done - v2 sent.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

