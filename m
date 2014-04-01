Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECFC6E3DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 23:14:43 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lh14so10529844vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 16:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=xesSOCrEw58gKzN7xhR5LW+wBouuAJfSTglEwpwMgDA=;
	b=A9r+vNRFacLtvVbzEENZdsFHu+mrZjH0wZXi8nBD1t0UWWSFViuXL0rmxwFlsxFQ7a
	qxCiWYE5mw2Rvi7XO38giMyY+7EwgPI0yAegy1W+8IZqOv/dW5tOH3vOfPtfoUybI53R
	27k8UXcsQhsYDjNcPfPbPAEFYS3kqXDrRBZzQW9zyrojsRxe6QW7/BXx4DY3LMh7pESJ
	MlO11sWPqCgB/VDOjiBjyXoel3ITQ5alyzweCP5Vpv4hTp6yPE3xwkR6AuvepoVH0bbm
	lTW6M+hpx8bs7AISofZqGdbzr+54AfJ/oRr5z7KmqOy+01vmFgACurNvwf7okk+hwUx/
	fmaw==
X-Received: by 10.52.173.165 with SMTP id bl5mr26332310vdc.13.1396394084580;
	Tue, 01 Apr 2014 16:14:44 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 16:14:04 -0700 (PDT)
In-Reply-To: <1396391792-12610-1-git-send-email-stephen.arnold42@gmail.com>
References: <1396391792-12610-1-git-send-email-stephen.arnold42@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 00:14:04 +0100
X-Google-Sender-Auth: 1Pwm0nq_RujvAlSd6IRIHBG7BiM
Message-ID: <CANyK_8e1SoC6wtWws+mJ6022_8kTtVYG+V0jvE0mnTjGKHWn_A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] changed gnuplot recipe license to gnuplot
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
X-List-Received-Date: Tue, 01 Apr 2014 23:14:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 April 2014 23:36, Stephen Arnold <stephen.arnold42@gmail.com> wrote:
> Also sent license file patch for oe-core.  This supercedes previous gnuplot
> patch that incorrectly included the original gnuplot patch changes as well.

Just got a few bits of general advice on submitting patches to OpenEmbedded:

Each patch subject should be of the form "thing: change", where thing
is usually the recipe name. So this would be "gnuplot: Use gnuplot
license" or something similar.

The "[PATCH]" tag should be "[PATCH v2]" if you're superseding a
previously sent but not yet merged patch. In this case, it's unclear
which patch your mean. Please email in reply to the patch you want to
cancel so that the maintainers know not to merge it.

There's a lot of further detailed advice and guidelines at
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

