Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSLcn-0005zB-Vs
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 May 2012 07:09:14 +0200
Received: by eekd49 with SMTP id d49so147634eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 21:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=p40vtuiL3gRdOn0JZHZaTRksdU/Sv9dCjdIgFasuudQ=;
	b=CwUCNbWrNxbnXIe34MWKY6YtR08dakFxqpgKminxwgNK5JGMllgTMbc1OnaO/wn1t2
	PhrTdLaTV//wmY7ipubvqmGowaLvyV2GiheYsp0ozx/gK7R0kWpKczEpnTEKeB3n8xE1
	pcOM+Cl8DF7AiS3AxEplpU8tLccTaX38HDmDYOGMlCnm7k3gF7egS22EEPE0OIRVyKuq
	wWRc5hK7rPI2m5rU3qp3MN2jW7xzl5BTGw9JPHucX9+b1wwMJkXOUH87KNF7q5Xp+Wzj
	eAY37LudU2pSwg9hYwrIxzs1/qhso0H5H/ORrJuZlE2MTtein71OowL5zoM7PnnByWnk
	Il1w==
Received: by 10.14.187.1 with SMTP id x1mr519952eem.101.1336625960372; Wed, 09
	May 2012 21:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 21:58:50 -0700 (PDT)
In-Reply-To: <CAA5cW2zfvw65-vtwCZWfTsnfAO8e-jA=qsd0zqXvStYfhhy8bQ@mail.gmail.com>
References: <CAA5cW2zfvw65-vtwCZWfTsnfAO8e-jA=qsd0zqXvStYfhhy8bQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 21:58:50 -0700
Message-ID: <CAMKF1soMDLn4nEPtL8SBvooG0o2PmtnN4EzebO7r8HmLeEFK9w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Provide a master/setup layer - best practice?
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
X-List-Received-Date: Thu, 10 May 2012 05:09:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 1:13 PM, Radoslav Kolev <radoslav@kolev.info> wrote:
>
> It seems like there's some "reinventing the wheel" going on. =C2=A0What
> would be your advice for the best approach and starting point in this
> situation?

all of them have + and - points give or take. So choose your battles
is I can tell.
combo-layers is a good way to start hopefully you will help improving it.


