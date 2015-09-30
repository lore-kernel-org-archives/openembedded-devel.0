Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2A876FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 11:01:52 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8UB1q0W031646 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:01:52 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015093006015265-788882 ;
	Wed, 30 Sep 2015 06:01:52 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
	<CA+chaQdHyhFqLDALSJ+90PEM0Z5a0fKn5vk4jApoJ_jWnW-WdA@mail.gmail.com>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <560BC11F.2040405@ni.com>
Date: Wed, 30 Sep 2015 14:01:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdHyhFqLDALSJ+90PEM0Z5a0fKn5vk4jApoJ_jWnW-WdA@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/30/2015 06:01:52 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/30/2015 06:01:52 AM,
	Serialize complete at 09/30/2015 06:01:52 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_08:, , signatures=0
Subject: Re: [meta-oe][PATCH] meta-oe: recipes-connectivity: add relayd recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 11:01:53 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 30.09.2015 12:38, Martin Jansa wrote:
> Why not meta-networking? Don't use INSANE_SKIP, this should be fixed, drop
> PR, is RDEPENDS really needed? Drop protocol and branch from the SRC_URI
> (default values).

Thank you for the feedback. I'll apply these changes and resubmit.
I'll also modify the libubox patch with these suggestions.

