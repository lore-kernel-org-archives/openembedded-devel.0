Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LuFRn-0000G8-IY
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 02:27:25 +0200
Received: by wf-out-1314.google.com with SMTP id 25so142320wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 17:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=43/gHrzmjifbL2zgfCEZWp9Iw8uRSPigd0iRb7OQalY=;
	b=CmY6VOJ94b6/5BH6Jl4ENCd6Qj+G9KdrS4sq5UsShCNy4IYYdtY/Y5lxDrWOaxTzQt
	FFMuZ1Ho6ktn5w0QoOsYEXTIuSsqVbo+g8fYo1Mb3js6ZSz6mJCByUNwPS2XOcdHb6bL
	Qn/j6L7Y1CLixQjebKAJKRd1z92IbzKdlqegY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ID8fIV1nhugjaOtKKYdcDvD2S126pt4fmnVB8X5i3PnluAFIJT0EuCdqlOwnEuTyby
	PgHWKmDyIpsxZaz11pgcNOUUdrxOq2LPP8EKoWitg46zdcAvvfXImpQH6QkcdRyRX87Z
	/4b09hKb0RXCo/xG2T/N0GCKo+e0YGkNkZoiA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.13.14 with SMTP id 14mr1301883wfm.108.1239841409240; Wed, 
	15 Apr 2009 17:23:29 -0700 (PDT)
In-Reply-To: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
References: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
Date: Wed, 15 Apr 2009 17:23:29 -0700
X-Google-Sender-Auth: 9d0e307b5ac67c74
Message-ID: <b6ebd0a50904151723pe7087adkb69e57d608e8b226@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.200.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: Re: [PATCH] base.bbclass: Combine all checksum.ini files found in BBPATH
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
X-List-Received-Date: Thu, 16 Apr 2009 00:27:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Apr 15, 2009 at 12:59 AM,
<petri.lehtinen+openembedded-devel@inoi.fi> wrote:
> From: Petri Lehtinen <petri.lehtinen@inoi.fi>
>
> This makes it possible for overlays to have checksum.ini.
>
> Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>

Nice feature, good to see.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


