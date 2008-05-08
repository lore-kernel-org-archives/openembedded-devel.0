Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1Ju5Kd-0006iH-BE
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 14:34:43 +0200
Received: by fk-out-0910.google.com with SMTP id 19so861957fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=1XUFxfITsqfRPWOXhULjjO1fm2hEF9sGoJCDebHBVV8=;
	b=aJrhzGYOmUOwZhXijnhhYem5M6K02dV9qwq7UACHHOKF9amQUjfeJpiP9mz2OlAtZhWn+VvNVSl4J104+dOFc3obU1aDJpolGLGGAsk32BtVBLlFZkPxlbnRvRK/T/HqIG7GO+ezOk1Rq7Xg5q3PgTd+HFhoc2QF0VuKiMfFOyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=BpybQpjU5JarGnXe1+NFKAH15e+8kEP5/Hp7d4B8a7efm7gO9NY7zRsxOMj3utwXaMnxRKiL8hVkCSwl3UvGyLNn3k12DnqGYBJBxZ0Gs5pzl1JRumr2/os79XKem/Eha3z1YOU7IGkPQhB0ps8mlSSISreWWvdh6iWwodSthXI=
Received: by 10.82.167.9 with SMTP id p9mr382180bue.40.1210250042220;
	Thu, 08 May 2008 05:34:02 -0700 (PDT)
Received: by 10.82.119.15 with HTTP; Thu, 8 May 2008 05:34:02 -0700 (PDT)
Message-ID: <74d0deb30805080534v6be5f293xa14fe5c159968555@mail.gmail.com>
Date: Thu, 8 May 2008 14:34:02 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fvunn9$73m$1@ger.gmane.org>
MIME-Version: 1.0
References: <fvu8b8$kl2$1@ger.gmane.org> <fvunn9$73m$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: Disapproval of revision b8e46b797b32111526a2116d020fdd9e1c079965
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 12:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 8, 2008 at 1:21 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
> Koen,
>
>  thank you for continuing to keep such a close watch on every single
>  commit I make and raising hell every time you find a chance.

Actually, I was just about to do the same thing (reverting, sending a
notification, wouldn't call that raising hell) when I noticed Koen's
disapproval, so thanks for the quick fix.
Just saying, this is because gmp is a pretty prominent package, not
because Koen is closely watching your every step. Of course the latter
part is only an assumption.

>  My apologies for the breakage.  I did md5sum those files, but I must
>  have overlooked the odd-man out.

The good thing is that you kept that odd-man out by accident, because
otherwise it probably wouldn't have been noticed so quickly.

>  I don't take breaking things lightly and you all know that I put in
>  great effort to get OE into better shape every time I touch it.  But
>  additional breakage will happen from time to time (and yes, cleaning up
>  after others is *NOT* the greatest fun in the world!).  What's important
>  is that breakage is dealt with after it occurred and I guess my record
>  is clean there.
>
>  So, yes, thank you, too.
>
>  Regards
>
>  Rolf
>
>
>  PS: As you are all aware, my CPU resources are quite limited and all the
>  time in the world spent compiling will still let some things slip through.
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

regards
Philipp


