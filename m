Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1SDEeo-00089M-EN
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 14:40:50 +0200
Received: by vbbfr13 with SMTP id fr13so1584208vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0SMn6s0RYarnAGKDAhvTmKaoewQHrflNhj66NGfLmBs=;
	b=iv8r6wjO6EcyKqkvRVBvrSfgfNF88Af0nGOqLxmIFV4BVgZdWQ9qs2m687PbulukNn
	BMXbKApI2sb8GgWPVPOOJPfkjFh6kDPEYs1X5vLnRfU9Rg9jO/5+xXReDLg/DkA+wLJn
	Sfog09gNSs38YCngqXckAlPIRfWy3WtFRfu639wwPpWp8Fbd3XI05S9wY36LTBfrHoz9
	O97MMfGLWXJ5TAyXKASjr9TRUUCChyHW2AO1wMdhfrG7Qax4dl4lKVwXV6FjuolbfMSh
	lrqbGqE2xnIQ1hR0cYjti8fI5nPFQ4EgAVB2c5Ef8QZYwYBxCa3PyJtCFBn3BRzH8lRl
	nSsg==
MIME-Version: 1.0
Received: by 10.220.115.82 with SMTP id h18mr16072484vcq.18.1333024305951;
	Thu, 29 Mar 2012 05:31:45 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.148.68 with HTTP; Thu, 29 Mar 2012 05:31:45 -0700 (PDT)
In-Reply-To: <4F744944.7070701@mlbassoc.com>
References: <4F7444E0.400@mlbassoc.com> <4F7446F9.9090304@opendreambox.org>
	<4F744944.7070701@mlbassoc.com>
Date: Thu, 29 Mar 2012 14:31:45 +0200
X-Google-Sender-Auth: 2z3ZjCjJjpq6Eca9a-HaF8BRlXs
Message-ID: <CA+2YH7udxSwoROJk6+qV9Qa7QUTdnaxEhtLy-bW6q8RJKp9JtA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Where are my patches going?
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
X-List-Received-Date: Thu, 29 Mar 2012 12:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 1:36 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-03-29 05:26, Andreas Oberritter wrote:
>>
>> Hi Gary,
>>
>> On 29.03.2012 13:17, Gary Thomas wrote:
>>>
>>> A number of times when I've sent patches to the list via 'git
>>> send-email',
>>> they seem to never arrive. =A0How can I figure out where they are going=
?
>>
>>
>> your patches arrived. You can find submitted patches in OE's patchwork
>> installation [1] or in the mailing list archive [2] some minutes after
>> they have been sent.
>
>
> That's good to hear, but why am I not seeing them on the list?

maybe because the mailing list server knows they were sent by you
and/or you are on cc so it doesn't send them again?

Enrico


