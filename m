Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1NttkB-0000ne-5i
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:21:23 +0100
Received: by iwn4 with SMTP id 4so1810336iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 19:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=X1bT28YYxY/BasQJce4/MLqtBl1tvO9woOfCgyWCPPY=;
	b=XULgYnrYa9aPlWvK6tqfps8LpFxa078812gdzzn8Uvka3sZmtsUckftWSpYd55NL/u
	vqzK3VAWmUri4ms+hSAjFlCrkENp2Z7xwZkFkOClg9OhgxZntAV1LYI3XiKO257Jm/1B
	xOkTaRO+vOsrXuANIPxlnb7HieuyqdGxFzaEY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=NMN/dM3e34+ZbiMmAf17URJ3yfyeHKLxh5m6se0io8Ty0hJNJGcsZ6pcrN50SjwwMX
	NOkelEAybn4QsBZvi12I/1k83gruXcuNcclLcCvVTBR5AHNRQyH8WsZ4RrchV/Plvpzy
	zzAvYmI6adDLm0uGYw/nBTRJB1vKT39f/96/k=
MIME-Version: 1.0
Received: by 10.231.144.207 with SMTP id a15mr2037855ibv.94.1269310694071; 
	Mon, 22 Mar 2010 19:18:14 -0700 (PDT)
In-Reply-To: <201003172340.02795.bluelightning@bluelightning.org>
References: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
	<25809.193.195.44.178.1268139137.squirrel@webmail12.pair.com>
	<f275a9df1003090620i4abb58b9ye07151c9b27f5533@mail.gmail.com>
	<201003172340.02795.bluelightning@bluelightning.org>
Date: Tue, 23 Mar 2010 10:18:13 +0800
Message-ID: <f275a9df1003221918o5294bec0x37d83144a058e2f6@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: Paul Eggleton <bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: 'bitbake opie-image' problem
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
X-List-Received-Date: Tue, 23 Mar 2010 02:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

I bitbaked opie-image again,
and it worked like a charm! :DD

Now I'm trying to make our touchscreen work with opie. ;)

Thanks for the effort! :)

Thank you!
jiason
20100323


2010/3/18 Paul Eggleton <bluelightning@bluelightning.org>:
> Hi Jaison,
>
> If you update your git tree, opie-packagemanager should now build correctly. I
> didn't have a chance to test if it actually worked at runtime though, please
> let me know (privately) if it does or doesn't.
>
> Cheers,
> Paul
>


