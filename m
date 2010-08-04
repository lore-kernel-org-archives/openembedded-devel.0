Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ogi8w-0007uV-Gs
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:52:43 +0200
Received: by fxm12 with SMTP id 12so2600198fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HTRuYexMzvaOe/ZMTmaVCepb40FKzPL5Rh8MT6xEQvE=;
	b=ubvfe7wipcIF9LO5KPV73OUv1+PPSi/VtIKTnaoYSpUxsVmGwifY3MOndXiPs5Qh+S
	H+buSVgsCrrXE1n3j9/SZ5MQpCR7o8fAIqBlcncZftsBHcFTAZPdtM+FAjkz3VMwUkUi
	gtwOKumwDbG1MgRMn3odyr6hj0+9aRNmEqZKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=egym87fH93oxejhHuClB/zTp7hJEQ+7lUxm2wRGxstF6jj2MIZBl+KkoQigk8kfDmT
	0gqwKPBiDxrmDTuazVFh8JnvEdDodBF+GWbqqsIdTl/s5KLd7aSKSdiJWtFrqKii00Xu
	pHRFtBuLW/BP5XvQ4d9ttEDHexdLc2EM+AZQg=
MIME-Version: 1.0
Received: by 10.103.138.4 with SMTP id q4mr1081403mun.26.1280944358179; Wed, 
	04 Aug 2010 10:52:38 -0700 (PDT)
Received: by 10.102.213.28 with HTTP; Wed, 4 Aug 2010 10:52:38 -0700 (PDT)
In-Reply-To: <AANLkTimXqKMUJT4Cs+7h8pHEnhd5aQye_dLU35nqYtJq@mail.gmail.com>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
	<20100804165030.GG28187@mx.loc>
	<AANLkTin7L42p5JHP3SV9Gbo9VLtZyOHkeKx1OxEx9-bS@mail.gmail.com>
	<AANLkTimXqKMUJT4Cs+7h8pHEnhd5aQye_dLU35nqYtJq@mail.gmail.com>
Date: Wed, 4 Aug 2010 19:52:38 +0200
Message-ID: <AANLkTi=UsRguUtKsmSGOqNdw8AX3p9eaLgY1Vq6crYMP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 17:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

> Hi,
>
> Were these really removed yet? I have just pulled and they are still in the
> tree?
> Note that I saw this when parsing, not building this old version.
> Thanks,
>

Guess there is something wrong with your tree
they are not in mine (dev head) and here is the commit from koen:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=99f6333dd24a2a6eeeec0925a296906ee8145f92

Frans

