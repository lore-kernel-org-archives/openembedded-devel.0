Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LY1rk-0005L7-Uq
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 18:30:16 +0100
Received: by fxm10 with SMTP id 10so2527734fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zdZI++IZVJtf6SarrWSu/lzG4NXLT2B9Xu2HfB8E8wE=;
	b=vsufpYCrr+51ZW2S/qkpd9EHfbcE4ACrCP44LtBl0wXfupTfqFpt87rga+r/7yBRcv
	/b88RaDa7F2kvEJLsEtYEgj7DvnUqCUp5F8i5m4cT2phboUAeeJ6mmUMsFPkrpS2HYOb
	bAfOZXSSzKRvEAvWqAGGoql1TI+OErjj33ibU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wz3LsD1rvaIiNDfxDww4mVfU1SGqZy4E0l8lWAHMQ8nEVmScyQuANjH5nzS+UwOZcy
	TFH+dO6paT84V1lE2eI5qRF0uqPNO4GQK/OJlwtE0e/A2GN7ZDsB1cvUKc+CNx3kt29Y
	2GLNHXlkImiwNT2jhewTbMwwfj24ZxJkGfBVQ=
MIME-Version: 1.0
Received: by 10.181.137.17 with SMTP id p17mr10024bkn.193.1234546114545; Fri, 
	13 Feb 2009 09:28:34 -0800 (PST)
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz>
References: <200902131728.08634.openembedded@haerwu.biz>
Date: Fri, 13 Feb 2009 18:28:34 +0100
Message-ID: <d1b08f940902130928j681ab4acja90a0a59af04c896@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: checksums situation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2009 17:30:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Other solution proposed on IRC was to keep checksums in extra file in
> each directory of packages/ subdirectory. I think that it is not best
> but sounds better then one file.

I think Gentoo solved the problem very well:

http://devmanual.gentoo.org/general-concepts/digest-and-manifest/index.html


Regards

Andrea


