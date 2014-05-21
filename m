Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A5C0961F16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 09:08:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2014 02:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,878,1392192000"; d="scan'208";a="515321886"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.156])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2014 02:08:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Date: Wed, 21 May 2014 10:08:43 +0100
Message-ID: <46692786.LUQzjOGhxB@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45D6A@GBTWK10E001.Technology.local>
References: <5d1edcab304d4fbb8e6349d49bb62e98@BL2PR04MB852.namprd04.prod.outlook.com>
	<AAE0766F5AF36B46BAB7E0EFB927320633FFF45D6A@GBTWK10E001.Technology.local>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [poky]: libusb1_1.0.18.bb: configure: error: "udev support	requested but libudev not installed"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 09:08:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nick,

On Tuesday 20 May 2014 11:09:00 Lewis, Nick wrote:
> >configure: error: "udev support requested but libudev not installed"
> 
> We are seeing the same problem.
> This may be because the patch "libusb1: disable floating dependency on udev"
> has not been committed. May I please request this is done soon as our
> autobuilder has been broken for 4 nights now

FYI the fix for this issue is now merged as of yesterday.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

