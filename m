Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC0D72FB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 22:08:54 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id b80so8309657lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y0AhSyNL+pSPTD3V8mHjZC+6U7X6n3ftBqH8/mSNE5c=;
	b=AueK3RVPiQPjNfapyDcb6uE1jyA26n61OrZBK4ukGwc7uFFarQniJzWqhxA9erRShE
	P1BU+sMxe8jAqGiS/9hA4ZBhA/wXJuO1jyei9gemUUaYo37v022BzhJbHxl70ncsiQvP
	Cy50Ih0xw1NTIrhM1Fu8UDF6t4/9cqxIihTe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y0AhSyNL+pSPTD3V8mHjZC+6U7X6n3ftBqH8/mSNE5c=;
	b=hhaacWd3PHDV1/Nn+VS2o8f6woBpJrspBMeehZbq3pYEEEr9qqg3hIWK3bf/j+V6Ez
	4CjaMYDC7eEWN8hrp8FAEnbXlCIWyy7j6Y98l/49T5JJOoWI/5M2iwUGNK7fW95dUK7o
	NcfgZ6sQM0v8bJfWJsbM9C5PctHIjubtd7B+NO/NU6GyEvOHJGjHJe8qymbk4vaY63vg
	vqUN7DR6c8cakacyKAkgZPHoNxNSyHrnbTe5xWT7onmu3SHUVqUTNSXaUafvYUdgu4dB
	Vmlorb8YiSlXGY3U6fStW4eQ1Az0bfHnf+d0yG9WLKJw87egftU+FRWsVOKHX3+qtHOZ
	3b7g==
X-Gm-Message-State: AMke39mMva+E0SS56ac2lDlCqBL3Jo4IbFBi3mXZsMZf6MQ6q/sWpBcwOplE11wl+lFzCoGshpHn+d5QyLQMNEnq
X-Received: by 10.46.22.10 with SMTP id w10mr9209178ljd.65.1487801335535; Wed,
	22 Feb 2017 14:08:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 14:08:55 -0800 (PST)
In-Reply-To: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 22 Feb 2017 14:08:55 -0800
Message-ID: <CADfgfob+LnNAAqW6mKayt4N5CRz8LbwfAq7hUu8APMhjqiz5pQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"Lamego, Jose A" <jose.a.lamego@intel.com>
Subject: Re: [OE-core] Patchwork not picking changes from the ML Was: [meta-python][PATCH] python-paho-mqtt: update to version 1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2017 22:08:56 -0000
Content-Type: text/plain; charset=UTF-8

On Feb 22, 2017 1:56 PM, "Derek Straka" <derek@asterius.io> wrote:

Martin - No problem.  I'll resend the patches.

Michael - Would it be worth waiting before I resend the change sets?  It
looks like at least a subset of them have made it through.


Please wait while I make sure this problem is correctly resolved before
re-sending. I'll e-mail once we're ready.


Thanks.

-Derek

On Wed, Feb 22, 2017 at 3:55 PM, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> I've seen several issues with hooks. I was working on them yesterday and
> will continue today.
>
> These are currently managed by hand but we are moving them into
> configuration management which should help keep them working consistently.
>
> On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
>> On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
>> > Signed-off-by: Derek Straka <derek@asterius.io>
>>
>> It's not your fault Derek, but most of the patches from today and based
>> on the pings from today also some earlier patches didn't make it into
>> patchwork. This one is the only exception.
>>
>> Michael, Jose: are you aware of some issues with patchwork? Could it be
>> caused by the default Reply-to change from yesterday (or day before
>> during OEDAM)?
>>
>> I know only about issues processing merged changes:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10967
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10759
>>
>> And also UI issue in patchwork that paging doesn't work, e.g.:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?
>> submitter=&state=&q=&archive=both
>> shows that there are 5 pages of changes (which should be in most cases
>> marked as accepted by the hook above), but clicking on 2nd page produces
>> link which drops the query parameters:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?page=2
>> so it says "No patches to display"
>>
>> Regards,
>>
>> > ---
>> >  .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}
>>  | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb
>> => python-paho-mqtt_1.2.bb} (68%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.b
>> b b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > similarity index 68%
>> > rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > index b8f5f3f..c8acfc5 100644
>> > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > @@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
>> >                 python-threading \
>> >  "
>> >
>> > -SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
>> > -SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9
>> f2c4529b5689a65fde45e6f1ac36b9a261e"
>> > +SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
>> > +SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a2
>> 1eb66f436184691d0bf1f2a85a6213c6c1f"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

> Michael: one syntax error in patchwork code was pulled into production
> yesterday. This is the cause for missing patches. The error is fixed in
> the Yocto repo now, please perform a server code update ASAP.


Leo and I pulled changes and restarted so this should be in place now.

