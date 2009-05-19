Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M6Q1O-0003ZQ-T0
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 16:10:23 +0200
Received: by ewy20 with SMTP id 20so4830635ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gZBrd/0WAxM/Y4TBATX8CRyZpKDyFJYjkF7JclaqZhY=;
	b=t0eLy7NFOZAdjPCeywRqHkpX06ui7R94JpyMkqp4lVdWTdn6HLkoWUL6JoEhUzcSeS
	SzhA2Xx7gTM0pTWJ1Zm3DLWybjOF9QLdrcCBOJS+yjKLR/zZ9mhWmodh5+N6fxYhB2vf
	9BtG27WjNe1x+RTbReXYRaQCTJSYRhAy/4xXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eNhh21QFqhjEROiDuA4xh9H0eFoCChhJzgE28+KiG5qZhMAeg+yUvxJjDsX/q7IZUh
	Lyli1iUUxRZiWibBvcjCevA9xk/2VrjWZUm0UD5l7AeAlYQwQ3Egk42A1Li+/v8Y5Dch
	kxN3YO2wo+i3fyyaajtnhOYnuXvZuW9L4v6H0=
MIME-Version: 1.0
Received: by 10.216.71.82 with SMTP id q60mr17861wed.169.1242741778556; Tue, 
	19 May 2009 07:02:58 -0700 (PDT)
In-Reply-To: <ac9c93b10905190519h5cfa8a96h688bbc00271de76d@mail.gmail.com>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<guq6vh$tmi$1@ger.gmane.org>
	<ac9c93b10905190519h5cfa8a96h688bbc00271de76d@mail.gmail.com>
Date: Tue, 19 May 2009 16:02:58 +0200
Message-ID: <5c5e5c350905190702q56506baaja5a0abaff11e0d9c@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Tue, 19 May 2009 14:10:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2009 at 2:19 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I think adding recipes-broken (or broken-recipes) is a bad idea.
> [...]

How is this different from having recipes/nonworking and
recipes/obsolete as it currently happens?

more visibility?

-- 
Elena ``of Valhalla''

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


