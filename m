Return-Path: <Fahad_Usman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D53796A990
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 10:37:34 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1UmiQo-0005uB-Bm from Fahad_Usman@mentor.com ;
	Wed, 12 Jun 2013 03:37:34 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 12 Jun 2013 03:37:32 -0700
Received: from [137.202.157.99] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Wed, 12 Jun 2013 11:37:30 +0100
Message-ID: <51B84F65.7010301@mentor.com>
Date: Wed, 12 Jun 2013 15:37:25 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1371020915-14924-1-git-send-email-fahad_usman@mentor.com>
	<3639423.KAoAmRbK6q@helios>
In-Reply-To: <3639423.KAoAmRbK6q@helios>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 12 Jun 2013 10:37:32.0620 (UTC)
	FILETIME=[D86E18C0:01CE6758]
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][dylan][PATCH] libmtp: add new recipe
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
X-List-Received-Date: Wed, 12 Jun 2013 10:37:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2013 02:45 PM, Paul Eggleton wrote:
> It looks like this recipe is not in master so it would need to go there first.
> I'm also not sure if this is really suitable for meta-networking; MTP is
> indeed a protocol but it's more something for communicating with cameras and
> media players, so I'd suggest the meta-oe layer for this where we have other
> similar components (gphoto2, libimobiledevice, etc...)
>
> Cheers,
> Paul
Hi Paul,
I will re-submit this patch against master branch and in 
meta-oe/recipes-connectivity

Thanks,
Fahad.

