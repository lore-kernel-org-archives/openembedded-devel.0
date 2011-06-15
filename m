Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QWlvA-0002u8-J2
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 10:57:58 +0200
Received: by wwb17 with SMTP id 17so176877wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=RDmgppYteOGonBuft6+DLp27bZLjPN5T/EI/vggvry4=;
	b=UYu34f97w5zo6Dlkh22wOE+1DIPXkLbrmz4PLtPSztWTGFlPkyKlPOZCOBUmRho00P
	OZA1Nu7HoGgByBRDIrALz/8Q8HWCblr7VFV5uhf9YWlsKGJt5qrQIFaazT1THGP6xk1W
	ktYyqRfDymtPSKewF1hYgJXJtM6Z4rVmKsEwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=BmTQQae4fFYpvFv06CGL2dTaqCTrrYrunLqT+p1aW9Q8Rn2/Qkd3KxlIGMODGNH4Dp
	9oXHIgvKJpiHv2iBubaYK43YKkNspBLPEqpx5D6eqbZQYmXbmTY+fLJZsWlP8126GhGi
	sCDHMw2exF4T2+bb67hgM4fVS+WTZdldExndU=
Received: by 10.216.62.137 with SMTP id y9mr1774406wec.107.1308128070490;
	Wed, 15 Jun 2011 01:54:30 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id n20sm122415weq.15.2011.06.15.01.54.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 01:54:30 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Wed, 15 Jun 2011 10:54:25 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110615105425.3aa40c88@guibc>
In-Reply-To: <it9rjp$l8s$1@dough.gmane.org>
References: <guillaume.beraudo@belledonne-communications.com>
	<1308127322-5248-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<it9rjp$l8s$1@dough.gmane.org>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH v2] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 15 Jun 2011 08:57:58 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Koen,

> > * included IGEPv2 specific patch to get audio playback at 8KHz rate.
> 
> Is it igep specific, twl4030 specific, arm specific or something else?

It is not arm specific as it is needed by none of the numerous
Android softphones out there.

It is required by my igepv2 board (IGEPv2 RC - OMAP3530).


I have no other twl4030 powered board.


Regards


