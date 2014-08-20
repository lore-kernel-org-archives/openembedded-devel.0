Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 082AE65D53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 13:22:38 +0000 (UTC)
Received: (qmail 21073 invoked by uid 1003); 20 Aug 2014 13:22:39 -0000
Received: from unknown (HELO ?10.212.226.128?)
	(philip@opensdr.com@98.191.4.207)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Aug 2014 13:22:38 -0000
Message-ID: <53F4A10A.2000009@balister.org>
Date: Wed, 20 Aug 2014 09:22:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	meta-freescale@yoctoproject.org, 
	Holger Hans Peter Freyther <holger@freyther.de>
References: <53F49881.3090409@tekno-soft.it>
In-Reply-To: <53F49881.3090409@tekno-soft.it>
Subject: Re: [ANNOUNCE] New telephony recipe with Asterisk 11.x, OPUS codec, SRTP and libPRI
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
X-List-Received-Date: Wed, 20 Aug 2014 13:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/20/2014 08:45 AM, Roberto Fichera wrote:
> Hi All,
> 
> I've made freely available a new telephony meta layer at

There is already a meta-telephony at:

http://layers.openembedded.org/layerindex/branch/master/layer/meta-telephony/

We should try and avoid having layers with duplicate recipes. It does
look like asterisk in meta-telephony needs updating.

Also, please remember to use the layer index to search for recipes
before writing your own :)

Philip

> 
> https://github.com/DICENetworks/meta-dicenetworks
> 
> In the new meta layer you can find Asterisk v11.9 recipe supporting
> SRTP, OPUS Codec as well as libPRI, DAHDI kernel drivers and tools
> and GSM library.
> 
> Feel free to suggest any improvements and fixes.
> 
> Cheers,
> Roberto Fichera.
> 

