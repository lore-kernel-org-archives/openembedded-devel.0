Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OiksC-0000PG-Bc
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 11:11:52 +0200
Received: by fxm6 with SMTP id 6so531489fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=M9vq5RnZ5hXGA+aNeWPHOkTepQQ2HVqhmtTpq8DzX0w=;
	b=KbyQPBVUVxN8NJ5cicHmhAeGOTNdc9Gob6dBsdfST8AeVpwXwIKKATQKhiO16vLgqN
	JxBpzFdzDzqKTTaPYr3yBol+/dE9Lm1Guw9mrUOkCUVSqvzVp7WvXLjF2mcYV7YNUF0v
	Pw55uGuSk0FUCJVlA2fCtaeKBTUhh1+rwNKn8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OIbugrNPS8wa6k0NBXPgF7/8qU7/1r3k5unN7TfhRt9CGHjmDZDfYY90MsklTRcAiP
	ed/LP5jzcwlho3/ft6jQhMnqPUKvG+Ta0nWJZEaBWTN9ZGdcgyiQNH/Z9uSYs+y4pN4v
	Ic5CMl6pVXEcEnXwPnYIODWVZfYmYlxYRaUqg=
Received: by 10.223.122.194 with SMTP id m2mr17717616far.85.1281431501222;
	Tue, 10 Aug 2010 02:11:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 8sm696905fav.38.2010.08.10.02.11.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 02:11:40 -0700 (PDT)
Date: Tue, 10 Aug 2010 11:11:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100810091147.GB7507@jama>
References: <1281430963-20158-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1281430963-20158-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openmoko: removed distro
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
X-List-Received-Date: Tue, 10 Aug 2010 09:11:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2010 at 11:02:43AM +0200, Frans Meulenbroeks wrote:
> As discussed on #oe on aug 10, 2010.
> Removed because this is not used or maintained any more.
> 
> A message
> *
> *
> *    Sorry, The Openmoko distribution has been removed on aug 10, 2010.
> *    It is recommended to use the SHR distro instead. \
> *    \
> *    If you really need Openmoko you can still find it in git.
> *
> *
> will be given if someone is still using it.
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Acked-by: Marcin Juszkiewicz <hrw@openembedded.org>
> Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

with warning modifications suggested now on IRC by hrw:

Acked-by: Martin Jansa <martin.jansa@gmail.com>

Regards,


