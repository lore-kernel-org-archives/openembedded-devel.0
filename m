Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P38RT-00088s-LD
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 16:24:36 +0200
Received: by wyb35 with SMTP id 35so6213447wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oj8uCnDAqVE4jkyQZwkzbCX+zIzqHnEyrll2DbUjHr8=;
	b=MjUL1AcirVruWYmYjJk+M0ufttexLkewcmCrQJYhp8ZK9NLA6n6zwbLyg8+Tgkg+dt
	KPYFzndAd0MlM0425lvr+k7DilHGDusYkwekmyjdeOwfjMeF5x/c0qZKSb4mmnk2AnPE
	kaQ0AEaN+VWraylM4Y/V0VD/hPDVbwVim6UmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=yFgO6+fcC/xy7spd7Cy16wyNBuVQ1DzLdU5t7891L4Q+2QE5ebN+X+RfW7aKdZo7ho
	zdpU8Z6MqhVwmM2KIZTr8s4kNVNSiVn4YCl+9PC56GH8eX0Pe5mXWNY5fRAJL8BFn9Fa
	ULC000gz9zLKb7ygdqJD/NpqE/iojG3AC+TuY=
MIME-Version: 1.0
Received: by 10.227.151.70 with SMTP id b6mr3494795wbw.6.1286288652154; Tue,
	05 Oct 2010 07:24:12 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Tue, 5 Oct 2010 07:24:12 -0700 (PDT)
In-Reply-To: <AANLkTikaunRh8wSWihAN3C9xh++YBH2qZT8Tr_xdxVF-@mail.gmail.com>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<20101005123257.GD3517@excalibur.local>
	<AANLkTikaunRh8wSWihAN3C9xh++YBH2qZT8Tr_xdxVF-@mail.gmail.com>
Date: Tue, 5 Oct 2010 10:24:12 -0400
Message-ID: <AANLkTikHcHx5=mOZ7CmvkrnuBXk2dGuFKPWCcaJ=gAVm@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 14:24:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 5, 2010 at 9:23 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Oh, one other thing.
>
> Personally I would prefer it if the testing branch could be made on friday.
> That way I (and I guess others) can use unused CPU cycles @ work
> during the weekend to do the test builds.
> How do others feel about that?

I think this is a good idea -- so the testing cycle would run from Fri
to Fri instead of Mon to Mon.  As this weeks build is broken for many
combinations, it would be good time to shift to Fri as we will not
lose any testing time.  I'll plan for this Fri unless there are
objections.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


