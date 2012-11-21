Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TbDTm-0003lj-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 17:48:50 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so4896320ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 08:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FF0ZhPC6VO4jMx++q8aUZ0ZwAz90CEC51OB8x3mGvAk=;
	b=QVA3zVYjsvORvkl90DCUYst5ges70Pagkk5pITuG9RQFM06H/YRVq0QgNTPsLUki5W
	pdhXKQT9i8DcsIr+U/CJPy2J16YrklSEO7y66922JySaSMjRrqpaaJ/YxBh6VCj2TX28
	IXG2oXWFKYQZAvMwAQTlp590gYg3kr2IZaHO9dwH4g/QwaOGTXXtCnzjqtdPaB8FZ06K
	lTdVmHD1CWr977AxC4SvYgBYItx6U7EEQ+EBXbmYpYBAwMuaHsQvG06WMHkT+Rb1QNM6
	kz6bWnsmZ6oShDz5RV1R8EAvldcrzpg1gbuu3a77oqi+t5lvuJb3utQfIGjsjCipQyqy
	LbQw==
Received: by 10.50.178.67 with SMTP id cw3mr16942igc.53.1353515684543; Wed, 21
	Nov 2012 08:34:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.127.194 with HTTP; Wed, 21 Nov 2012 08:34:13 -0800 (PST)
In-Reply-To: <20121121161712.030af137@eb-e6520>
References: <k6b5r8$edu$1@ger.gmane.org> <20121121161712.030af137@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Nov 2012 08:34:13 -0800
Message-ID: <CAMKF1srnGbWDNjKx=6udw8EVLf_CFSaM5u7_TSmBfJx2xzpDSA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Wed, 21 Nov 2012 16:48:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Eric

If you have time thats good please go ahead with danny too. I have been
away for most of time after ELCE

Thanks
-Khem


On Wed, Nov 21, 2012 at 7:17 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Hi Koen,
>
> Le Thu, 25 Oct 2012 12:55:47 +0200,
> Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :
> > As for branch maintenance: any volunteers for managing the
> meta-openembedded
> > 'danny' branches? There doesn't need to be a single maintainer, but it
> would
> > be nice to have one person coordinating everything, even if it's just
> > pulling in danny-next branches from the layer maintainers every week or
> so.
> >
> > As I said above, I'm swamped for the next 3 weeks, so can people who ha=
ve
> > used or are using the 'denzil' branch weigh in with
> feedback/anecdotes/etc?
> > I have such a document for oe-core 'denzil', which I keep failing to se=
nd
> > out, but it boils down to "better predictability for merge windows".
> Please
> > share your experience for meta-oe here.
> >
> if wanted I can continue to handle denzil and also danny branches (and
> should have more time than for denzil).
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

