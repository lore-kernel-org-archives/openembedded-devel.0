Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oe9gs-0007GZ-EB
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:41:11 +0200
Received: by wwb31 with SMTP id 31so780wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=j9JhUdbiuQAr/zpAZjEsNNhN723fpkTTLgfmx3SmXlI=;
	b=OMX020LXrCYuPZKAjXr6tQ5csMWIA+qqatqbJM89eD2nBbwvr/C42ugsTnifS8Tmnu
	WSsBK5CTuUQ8eVh9MOQ38rcGg0MrA5e3ulUm3V8cwhqDK+PnmR9CS9/xWlpG13x+Nu4M
	yzRjqtYeeiNYYLoyu5OP+FHpaX7Lw4bjXayk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Jem9UzY8s3wlvySeQdh8kgXnINWDP2rw3OSB49eiPJWTzxrgo2ZRbTk1v8BFHRnaUE
	nbvHjFOuuI/Mo2UWgk51azix9/ar5ZYqW57murDvZVfHYxjFs8DZlu8+KY0RkHMaK2RD
	cEJcyrfiZWqKW3vVwmyy311xN8wDUOYkRUqaQ=
MIME-Version: 1.0
Received: by 10.216.177.193 with SMTP id d43mr10900862wem.34.1280335247785; 
	Wed, 28 Jul 2010 09:40:47 -0700 (PDT)
Received: by 10.216.234.166 with HTTP; Wed, 28 Jul 2010 09:40:47 -0700 (PDT)
In-Reply-To: <i2mdao$737$1@dough.gmane.org>
References: <i2mdao$737$1@dough.gmane.org>
Date: Wed, 28 Jul 2010 12:40:47 -0400
Message-ID: <AANLkTi=qcJf87fWok-9EquBeFRHGveKwvG4_Bvpeh=jd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE server problems
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
X-List-Received-Date: Wed, 28 Jul 2010 16:41:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 27, 2010 at 6:44 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> In the past several weeks the OE server(s) have been down for extended
> periods of time without so much a mail to this list about the cause,
> solution or anything.

From what I understand, the server that is hosting the OE melo virtual
machine (http://wiki.openembedded.net/index.php/Infrastructure) has
some stability problems.  The VM is being moved to another physical
server as I type.  Depending what problems are found, we'll try to
figure out the best path forward.

Thanks for your patience.
Cliff


