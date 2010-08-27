Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ooy87-0006tE-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:34:00 +0200
Received: by iwn2 with SMTP id 2so2494222iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zG/44nCOLBkjjWv/CGEC65cI1yxJl53mBmw+kuRPD/A=;
	b=CTZx+VFyaPOvzPNFF1C516CWRIYzw5V5HdQ40FT+Xwk/7v6tbJW31MbsbuKeIaiPoh
	zYRJhClVkH66LhU6G1f1Ri9QQs3RBmeWg9CCThcfayYRr7P9kX4IsOAItzflnrMM2eOn
	+XERScGHdvLq/maTvDWlQtJszzV9T7zcLksK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tJdU0dd6WLHDy4b6eVzlm6fa0Aw3SLrDnn3Uk4peOp7uaGZrkFllESGd4c9t3zRUDO
	bOGFboOyELxbYXEpZw0u/2eI94kiCDmyKmW9jUOzAMr8nxkjzsBW8lf5b+6/bowO6kzl
	ENM7GOoBDRGjcUnBauyY3k7ae67eNhRXDeeqk=
MIME-Version: 1.0
Received: by 10.231.152.143 with SMTP id g15mr1117864ibw.76.1282912412143;
	Fri, 27 Aug 2010 05:33:32 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 05:33:32 -0700 (PDT)
In-Reply-To: <4C77AFB4.6000809@mlbassoc.com>
References: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
	<4C77AE8B.80607@xora.org.uk> <4C77AFB4.6000809@mlbassoc.com>
Date: Fri, 27 Aug 2010 14:33:32 +0200
Message-ID: <AANLkTinzN6HxeF--4odSbr9fvtAM+QtCaSaNOETVDic-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] review process
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
X-List-Received-Date: Fri, 27 Aug 2010 12:34:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Gary Thomas <gary@mlbassoc.com>:
> On 08/27/2010 06:24 AM, Graeme Gregory wrote:
>>
>> =A0On 27/08/10 13:15, Frans Meulenbroeks wrote:
>>>
>>> 1. If a patch does not get any review feedback in X weeks time; it is
>>> ok to apply it. People who need more time to review a patch can
>>> mention that in a short reply. In that case they are granted Y more
>>> weeks to review.
>>> (suggestion: X =3D Y =3D 2)
>>
>> I have always been a supported of apply it and see who screams. I have
>> suggested before that after 2 weeks without review any non core patch is
>> obviously OK.
>
> That said, what good does it do for those affected to scream if
> the originator simply ignores it??

Raise it. And if it cannot be resolved or discussed probably raise it
with the TSC.
Do you have a specific problem? If so I suggest opening a different
mail thread about it. Let's keep this one clean for disucssing the
process.

Frans


