Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1Oi1iB-0000OB-WA
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 10:59:00 +0200
Received: by iwn38 with SMTP id 38so2702741iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=g5JCJJoKKUBxjOqCyQWcf23Wf03HradyxlgRpsPVIx4=;
	b=BjFr2wPoyk4dlfmONz/Cyfgxh2oq3aeI1nI5npY3WwxvyBwLi2IduRCAe4bQy/zlBD
	f941Lae2AszDiL0sDNc+Spz1ZTIqx7X2OYN79Bm9f1p8cKze+DFDS6RlPWFvmAtUM/pO
	4VzuuYsl2QBwLs3Olh8+1P6nG5jl1XT4RBObc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EZpT7m3FkTMimDB2lU1LUQAojGp4k8RdQEX8uw5aSld3sBiE55JrTyXxgHMNZeOwHR
	FQKoOiuBdjvZanEui46yfDbNXueSZmcq9yAyrUevQKm9vEDASwmjc9Q9Hd6Jfan+dqPJ
	hDsqJsmce2CB/ZD72A6jRxCed1BMjWN3lcTnU=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr16776316ibb.32.1281257895089; 
	Sun, 08 Aug 2010 01:58:15 -0700 (PDT)
Received: by 10.231.145.69 with HTTP; Sun, 8 Aug 2010 01:58:15 -0700 (PDT)
In-Reply-To: <4C5DC505.9080104@eukrea.com>
References: <AANLkTinV5sK_s_oNS5XjbzphdOFkMi2jvkOwa4-zMj8k@mail.gmail.com>
	<4C5DC505.9080104@eukrea.com>
Date: Sun, 8 Aug 2010 14:28:15 +0530
Message-ID: <AANLkTinmLkXeKMtYfdXacu-KfUaaFsOPTd6wnnbgSvOs@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: getting gstreamer interfaces on openembedded
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
X-List-Received-Date: Sun, 08 Aug 2010 08:59:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 8, 2010 at 02:11, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi,
>
> Le 07/08/2010 19:09, Anand Sivaram a =E9crit :
>
>  I am trying to build a gstreamer application which uses
>> gstreamer-interfaces,
>> (to be linked with -lgstinterfaces-0.10) but I could not find any recipe
>> for that.  Any idea from where I could get a recipe for gstreamer
>> interfaces?
>>
>
> it's in libgstinterfaces-0.10-*.ipk generated from gst-plugins-base recip=
e.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks Eric,  I could find that.

