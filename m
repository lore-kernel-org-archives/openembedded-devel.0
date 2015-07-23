Return-Path: <kimmo.surakka@vincit.fi>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7D83F761B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:54:23 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so146840543wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1HLexxNZj1fqntARd+IK4wx7PGRxWGKQzAKIMWNMyaE=;
	b=cyjuwJlXl9GQjt/h9kGqgg1unfcnKxFy7PzPpjcqx9CJStU1Q1XvxKJ3nvlKHhqvk+
	MoLhaGtqj5TFZgHLfNz+OgGKqV5E5wBfjZmjVjzfHktIVK/FHiNrY6t9voiFeWMxhk9W
	3e7pY7H2vmycpidiRwmeXD7iJiy+nyDJP0rgWRTO11cDk1R2WQMqC+DseQaIrokOW//I
	eRGIEYoFESfYtKIHgPwctiYzfk1HLSOQTwgqyJCvfCVK+D3jDFIb2bS+o8TFY5DEkCe/
	dps6YpV7JmQMlAb99Iefp7kqA7B6aix92yWCESXZlVseENiVJg/71szkSJzJ13JawaOR
	2gdQ==
X-Gm-Message-State: ALoCoQnwio1SRkc3ocexfZcJ0zYi3wB2U7Uwjy0C85yHdX0c2RdlDQj+eHJgZ0ofa0M6aOq0MuW0
MIME-Version: 1.0
X-Received: by 10.194.62.211 with SMTP id a19mr15998705wjs.126.1437663255356; 
	Thu, 23 Jul 2015 07:54:15 -0700 (PDT)
Received: by 10.194.100.1 with HTTP; Thu, 23 Jul 2015 07:54:14 -0700 (PDT)
In-Reply-To: <CALbNGRSuqOQAkknE7uUAWShnOrYr66ZY6J-hFQN3hqDn44db3A@mail.gmail.com>
References: <CAPwmkWyXiyKFiCWH52JKA-gAJH9jqfpUG1Z7TrLCTdLp9HgvBg@mail.gmail.com>
	<CALbNGRSuqOQAkknE7uUAWShnOrYr66ZY6J-hFQN3hqDn44db3A@mail.gmail.com>
Date: Thu, 23 Jul 2015 17:54:14 +0300
Message-ID: <CAPwmkWwWzFx1Jx3ko2YrkdZhC-8tBLVa8Au0MjQfcP=ZRuhaLw@mail.gmail.com>
From: Kimmo Surakka <kimmo.surakka@vincit.fi>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] imagemagick: update patchset from 4 to 9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2015 14:54:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Resubmitted, hopefully with less corruption this time.

2015-07-23 14:03 GMT+03:00 Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>:
> On Mon, Jul 20, 2015 at 11:17 AM, Kimmo Surakka <kimmo.surakka@vincit.fi>=
 wrote:
> Seems patch format was corrupted
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

