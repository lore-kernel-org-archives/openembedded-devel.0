Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaYsk-0004YQ-I4
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 21:23:22 +0100
Received: by lami14 with SMTP id i14so35612lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=i/Cho547XclrVj6cx8o+IcvlWGvOcwKQUpnOQDXKxag=;
	b=jE9yJXiUyWaQM+y7fZIk0Q+DJZduhiTLJHkjIOb4UmBsWg999DQVDOooMRclKGaW7x
	oczfdhypwWzkrYReTUNAXOkaeTJj2fLo9IeAz7cMi65fCiEWOX4I20xNNx4LL2M9e/bp
	XlAEIVTuIrzAB0hzOZkG0qgdht/7YMAzCNljk=
Received: by 10.152.106.115 with SMTP id gt19mr16664363lab.27.1323807386437;
	Tue, 13 Dec 2011 12:16:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 13 Dec 2011 12:15:56 -0800 (PST)
In-Reply-To: <4EE7A9CA.2050904@linux.intel.com>
References: <1323789098-6941-1-git-send-email-ulf@emagii.com>
	<4EE7A9CA.2050904@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2011 12:15:56 -0800
Message-ID: <CAMKF1soZMLXz2_0OU9-4HmEyYDK-h40=940cCTqf8O53AkR7-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ulf@emagii.com
Subject: Re: [meta-oe] tz*: download location has moved
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
X-List-Received-Date: Tue, 13 Dec 2011 20:23:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2011 at 11:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/13/2011 07:11 AM, ulf@emagii.com wrote:
>>
>> From: Ulf Samuelsson<ulf@emagii.com>
>>
>> Signed-off-by: Ulf Samuelsson<ulf@emagii.com>
>> ---
>> =C2=A0meta-oe/recipes-extended/tzcode/tzcode-native.inc | =C2=A0 =C2=A06=
 +++---
>> =C2=A0meta-oe/recipes-extended/tzdata/tzdata.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A04 ++--
>> =C2=A02 files changed, 5 insertions(+), 5 deletions(-)
>>
> This was fixed in oe-core, What's the reason that a tz* set is needed in
> meta-oe? =C2=A0Can we remove them from meta-oe or is the older version ne=
eded by
> someone?
>

there are some differences e.g. met-oe it installs a sane default for timez=
one
may be if those differences can be merged then it would make it go away

-Khem


