Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA35608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 14:49:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2016 07:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="768280193"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 21 Mar 2016 07:49:12 -0700
To: openembedded-devel@lists.openembedded.org
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1458568492-29611-2-git-send-email-alexander.kanavin@linux.intel.com>
	<20160321145053.GD2562@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56F008EE.4060600@linux.intel.com>
Date: Mon, 21 Mar 2016 16:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160321145053.GD2562@jama>
Subject: Re: [PATCH 2/2] gnome-bluetooth: replace systemd dependency with udev
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
X-List-Received-Date: Mon, 21 Mar 2016 14:49:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2016 04:50 PM, Martin Jansa wrote:

>>   inherit gnomebase gtk-icon-cache distro_features_check gobject-introspection
>
> So you can remove distro_features_check inherit as well, right?

Yeah, I guess. Feel free to amend.


Alex

