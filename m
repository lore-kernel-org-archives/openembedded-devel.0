Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SlxbJ-0003Ga-Hr
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jul 2012 09:32:45 +0200
Received: by yhjj63 with SMTP id j63so6268645yhj.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2012 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=o9nYhvOzHsi/ohqC1zSiLKGsBWdSEM+ulPF3m1pN55A=;
	b=q209lC1aeRD3tydrf3JYL5RY4zT9w/4jBNHnAP3Fxe72XGSI2r2HcKa9w5SlP9uAnw
	QTMnP5pEvZDLJ/KLAVoIKBNCBSqNf6SvFHSJH3Q7K4ol1MlDXwED2dzGwdaV27e5CxAj
	PWom5cQO9xhJaZad62uWC8s/7Uho1sjfX+xvIvIOu8rm4afc/cGst6DkJrKlxARSCr/r
	+I6oGHRpkbZDDy045qlqn6bqE7Izzsc/C2sPWTzvvkgOvRcNboXVi647Y1YumVN3vyfQ
	nnrUjByhZmkBeSMFD5aTN9rSEN8cPofXzQmvS6oODlT5aYntgs2G+kNOKWMXhAOhAih1
	p3Vg==
MIME-Version: 1.0
Received: by 10.43.85.69 with SMTP id an5mr7770417icc.37.1341300098450; Tue,
	03 Jul 2012 00:21:38 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Tue, 3 Jul 2012 00:21:38 -0700 (PDT)
In-Reply-To: <1402845.lbylQD2lGx@helios>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
	<1402845.lbylQD2lGx@helios>
Date: Tue, 3 Jul 2012 09:21:38 +0200
Message-ID: <CALbNGRSeV4FLdpt0M3V6VBEz3B2M=MR=ubQM9tTRkV_hdAFMBA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, meta-oe 00/27] transit to meta-systemd (cover-letter-only)
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
X-List-Received-Date: Tue, 03 Jul 2012 07:32:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 2, 2012 at 11:32 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Andreas,
>
> On Sunday 10 June 2012 23:46:33 Andreas M=FCller wrote:
>> This is the first part of the transition to meta-systemd for review. It
>> contains the changes on all recipes inheriting systemd.
>
> Are you working on a v2 of this series? It would be great to move forward=
 with
> this.
>
> Cheers,
> Paul
>
Am under pressure but I hope to find time for that until next week
(Martin: Yes I know you got similar response two weeks ago - sorry)

Andreas


