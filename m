Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6Lgk-0004SH-Hc
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 13:09:35 +0200
Received: by yxj4 with SMTP id 4so2273967yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 04:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=r6D2AA8jzxFCcUoh4s64sy5cnNg50oXQ99ttgf9ZrO8=;
	b=FJNTcNtWFopX0p1WZ/rX7UCirLFf97qK2zECNHQe0j8IXGc4lPSFzqrvlI8WgKYzGw
	4SeKs6NcHxZ0M/+ApVM6jyqpxK1aFOCwcQHVVNCNnLPy0zZUuashKM+og9x49Qw+0W/6
	WwXgyv+vYaarZIFAPAMd2sdvrYaNknCN2Kbb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=n2a6i9tO9PPZ+E4voHhofPyMkGc1/yP3AwserpUsjffYr/DQKTQmxL50fnFbYhLlJ1
	loHskpH7nYXyqLcD+nmQG2fxu5qd3PZA9WpNHDO/WIG1m9whYQQBk6FVvCNH5qCA7sDN
	IsUqTLn/7CCw065erUChK5xALSL37mZOQUrSs=
MIME-Version: 1.0
Received: by 10.42.12.131 with SMTP id y3mr4728351icy.211.1287054543752; Thu,
	14 Oct 2010 04:09:03 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 14 Oct 2010 04:09:03 -0700 (PDT)
In-Reply-To: <4CB6E2EF.7080501@xora.org.uk>
References: <AANLkTikTXVNJmQ=8Ct77Y9W1vLjLqSgFapS7vV+RFM8Q@mail.gmail.com>
	<AANLkTinBDkwPaJaCqKbcmGxxmOZivG7JG8RC7pV2wvvr@mail.gmail.com>
	<20101013175113.GF11514@denix.org>
	<AANLkTikerdiZ978G2DVDTWO+iPB6gVeQ3nTYzRZLFR5N@mail.gmail.com>
	<4CB6E2EF.7080501@xora.org.uk>
Date: Thu, 14 Oct 2010 13:09:03 +0200
Message-ID: <AANLkTinedJMhv-YKO3_bPbWbuGj-DLsqzC1TmpAipoYH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OEDEM: info
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
X-List-Received-Date: Thu, 14 Oct 2010 11:09:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/14 Graeme Gregory <dp@xora.org.uk>:
> =A0On 13/10/2010 19:00, Frans Meulenbroeks wrote:
>> 2010/10/13 Denys Dmytriyenko <denis@denix.org>:
>>> On Tue, Oct 12, 2010 at 10:53:14PM +0200, Frans Meulenbroeks wrote:
>>>> 2010/10/12 Raffaele Recalcati <lamiaposta71@gmail.com>:
>>>>> I'm interested in attending to OEDEM for friday morning.
>>>>> I have added myself to =A0the list "Attending for sure", even if I'm =
not
>>>>> a skilled OE developer.
>>>>> I hope that I have done the right thing.
>>>>>
>>>>> See you in Cambridge,
>>>>> Recalcati
>>>> Raffaele, glad to see you here.
>>>>
>>>> Technical question to the board:
>>>> I thought the eV meeting was planned for fri morning.
>>>> Is that open for non-members. Not that I have objections against it
>>>> being open, but better get this clear upfront.
>>> Since Raffaele and Fabio are only coming for Friday morning, should we =
try to
>>> discuss technical aspects first, and leave organizational ones (i.e. eV=
 GA)
>>> for later?
>>>
>> FIne with me!
> If I make it down the only day I can make is friday, so if GA is moved
> away you will be lacking board members.

Suggest still to have it on friday.
Advantage to taking it to the afternoon might be that people are maybe
more interested to keep it short (in order to be able to head for beer
& food).

Frans (who is not too fond about those meetings, but knows it is a necessit=
y).


