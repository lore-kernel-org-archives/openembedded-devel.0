Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1PrH5q-0006L7-GU
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 22:45:26 +0100
Received: by qwi2 with SMTP id 2so4390077qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 13:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FRBBjyfj0476kKIgq8Cg3VOS4qjsbFpjGxib+hMOoM4=;
	b=IgpYVS9+kMDPYeLkMdY8KhdZEyfIaLeaeIHTbivpJO6mhC+G7PcQe77QI1TwP64aed
	0q80KgZvND06uvPMuOlt1FbJIesOzB51jUDozVFgDZRJDJ+1FmDKbfSGjLEk40qNvaVq
	LxlWflNbzrOLMsyYI1LTfe8DhlCBY6AFWi3pQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Sqa4YyOZnktj/rBcns50XiaVnRPcrHlrTDnHGDmKwjeo0kKjNPzVutzRFMENeqWkHe
	Nat+lE5sqZlHPo7w/vJkWz0oOaE3Yk7o2X0kFc07VytJHrilDGywx6oGJTh8XhSG+ALM
	/cU6Xe+78Oo9yG0i4RNt3oH/RGH5jTLgheesM=
MIME-Version: 1.0
Received: by 10.229.249.203 with SMTP id ml11mr461974qcb.199.1298238249248;
	Sun, 20 Feb 2011 13:44:09 -0800 (PST)
Received: by 10.229.91.142 with HTTP; Sun, 20 Feb 2011 13:44:09 -0800 (PST)
In-Reply-To: <4D618876.7020302@mentor.com>
References: <1298232756-24526-1-git-send-email-pespin.shar@gmail.com>
	<4D618876.7020302@mentor.com>
Date: Sun, 20 Feb 2011 22:44:09 +0100
Message-ID: <AANLkTimHMnAddtD7M-G1OJ7==+JFzTy1rojaYTUz10vD@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libacpi: SET OE LDFLAGS in recipe
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
X-List-Received-Date: Sun, 20 Feb 2011 21:45:26 -0000
Content-Type: text/plain; charset=UTF-8

>
>
> Note, in the future please see
> http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbeddedand be sure to included a Signed-off-by line.  Thanks again for your
> contribution!
>
>
Ouch, I forgot, I'll try to remember next time ;)
Thanks for applying it so fast!




> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

