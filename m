Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqzv2-0006Tk-Tq
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Apr 2008 02:11:33 +0200
Received: by an-out-0708.google.com with SMTP id b38so33888ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 17:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=Mnbl4qj957EGiRLAmLN1XdnR8jl95tc/8pVMjzaFmhU=;
	b=OhgIz0EGldqoQjdG/YC/LSTdtEr2IXPAqhF8kF8f8S0KMbeRhtDqsD3obwCVCGE12at2ZjRRD/9q5rcuSRxhQYxGfHVznQJz9pXJpNNbgDwyEikWYB1bzGKPloG71k/w/AI61gvT6CW1dVOfQ/Ii0Gf41I6LdJKVUxpRj8ya/q4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=T69X3GO3YV6/WfHfcUSZ6QkMXVwdUxrX0+tMSGt08dseOFQxNWfNtcOD4nq5PVk5wVqiylSAcByrl7efudnu7YRT34o95hjcdCdasOLv1TAnm+qRPn8bndpMrbsPgbdI1LXzJK/29+YTLEzg77YwZAxGmb8F6bO4k2zgXvXX6e8=
Received: by 10.100.33.4 with SMTP id g4mr88451ang.111.1209514262992;
	Tue, 29 Apr 2008 17:11:02 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Tue, 29 Apr 2008 17:11:02 -0700 (PDT)
Message-ID: <c384c5ea0804291711v184b9826k99fd9e899f0289f8@mail.gmail.com>
Date: Wed, 30 Apr 2008 02:11:02 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8609a9b90804291337m5d580672qb16413c2d675cd1e@mail.gmail.com>
MIME-Version: 1.0
References: <8609a9b90804291337m5d580672qb16413c2d675cd1e@mail.gmail.com>
Subject: Re: merge mutiple heads...
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
X-List-Received-Date: Wed, 30 Apr 2008 00:11:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

On Tue, Apr 29, 2008 at 10:37 PM, Johannes Paechnatz
<jpaechnatz@gmail.com> wrote:
>  when I try to checkout org.openembedded.dev I get the following error...
>
>  mtn: Zweig org.openembedded.dev hat mehrere K=F6pfe:
>  mtn:   1a467a7ea8dfd7463354c140383975aa0b8b20e8
>  freyther@openembedded.org 2008-04-25T15:51:39
>  mtn:   60d4d904e10f8212b1c2242377b31ccc2e29e374
>  freyther@openembedded.org 2008-04-25T15:03:16
>  mtn: w=E4hlen Sie einen durch 'mtn checkout -r<id>'
>  mtn: Fehler: Zweig org.openembedded.dev hat mehrere K=F6pfe
>
Either synchronize again, say 15 minutes later, and the server will
have run a auto-merge of the heads.

Or, run mtn --db=3DOE.db merge yourself.

Regards,
--=20
Leon


