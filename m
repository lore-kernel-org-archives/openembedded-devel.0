Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMPHu-0005P7-H7
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 19:42:03 +0200
Received: by pwj4 with SMTP id 4so2602638pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=zl0Lap/VolFpOiiQ01ATymSEwNkJYZSkqsERAKwoXr0=;
	b=xJwaFstakHgx0DVxH7XbFyPpP7/HkQQ4UUgn2MMB3//ebSHfAWUJEjaMLkkqVIyV3P
	l32PjmZTJ+Z6iaHH28kVOrM+De4RDKCXNjQFjBkKtr6qXA+47jPcp8jEHK/V4Lz6sBdm
	gjjuwDjTaQGok17q23qPRiOwNVVWKwHfYYSlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mG0WmZdvZ11ovN1y/8X06qnJNZmhoAzWJlegvYDEyl0AHbVOahcXi6aXJ64XObqzGi
	T9xCAQJ2mV8ijh582+rSsWRrSM+iQDcVrLLs8UiHq72ogF6hXRa5gFRKVD1NfgodnhNg
	hrMTHkYYiKGKgCQXRpYqaILSjIld/uzm230sE=
Received: by 10.229.181.3 with SMTP id bw3mr7271906qcb.155.1276105058815; Wed, 
	09 Jun 2010 10:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Wed, 9 Jun 2010 10:37:18 -0700 (PDT)
In-Reply-To: <4C0FC6F6.1050105@balister.org>
References: <4C0F9119.3000909@freyther.de>
	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com> 
	<AANLkTinL7xDvSoHdsxgkSumCFQNg8r3YC30gJUBcA-jO@mail.gmail.com> 
	<4C0FC6F6.1050105@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jun 2010 10:37:18 -0700
Message-ID: <AANLkTikvSTNGPYrlrNX66JLuDuzYOun5VjdV-q2sLzjG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 17:42:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2010 at 9:53 AM, Philip Balister <philip@balister.org> wrote=
:
> On 06/09/2010 10:57 AM, Chris Larson wrote:
>>
>> On Wed, Jun 9, 2010 at 6:53 AM, Frans Meulenbroeks<
>> fransmeulenbroeks@gmail.com> =A0wrote:
>>
>>> 2010/6/9 Holger Freyther<holger+oe@freyther.de<holger%2Boe@freyther.de>
>>>>
>>>> :
>>>> We were carrying the org.openembedd.dev branch name from the monotone
>>>> era into the git era and the TSC was asked to consider renaming it to
>>>> 'master' which is the git default for the main development tree. Now t=
he
>>>> actual change on the server will be minor what is of a bigger concern
>>>> are the existing users and documentation.
>>>
>>> Technically speaking I think we should have run an RFC for this before
>>> it was brought to the table of the TSC.
>>>
>>> Personally the org.openembedded.dev branch name does not bother me
>>> although I know master is the 'standard' git name.
>>> Afaik renaming does not really solve a problem.
>>>
>>
>> Personally, I have to type it at least a few times a day, it gets old, a=
nd
>> I
>> think its time we ditched monotone remnants where we're able to do so.
>
> I'm with Chris. The name is long and annoying. It is time to drop the
> monotone/bitkeeper remnants.


yes I am also in favor of getting it simpler. Although I do have
bash_completion for git
still its annoying because there are more than one branch names that
start with org.openembedded.


>
> Philip
>
>>
>> I am not too sure how much this affects the current users. Actually I
>>>
>>> doubt if the change is bigger than the packages -> =A0recipes renaming
>>> Isse is that if we do that we should make sure all relevant
>>> documentation is updated, otherwise we only create confusion (which
>>> might still creep up as people use old mailing list articles).
>>>
>>> Considering this, I am in favour of keeping things as they are.
>>
>>
>> If we implement this, I don't really see a problem doing it for the user=
s:
>>
>>
>>> =A0> =A0 c.) To ease this for existing users and to reduce the amount o=
f
>>>>
>>>> =A0 =A0 =A0support org.openembedded.dev will track master and remains
>>>> =A0 =A0 =A0available for a limited but long amount of time.
>>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


