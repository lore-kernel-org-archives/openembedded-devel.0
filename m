Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rzx8n-0007Qo-NT
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 22:20:53 +0100
Received: by lahc1 with SMTP id c1so8275225lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:12:34 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.47.225 as permitted sender) client-ip=10.112.47.225; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.47.225 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.47.225])
	by 10.112.47.225 with SMTP id g1mr10206271lbn.52.1329858754427
	(num_hops = 1); Tue, 21 Feb 2012 13:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qLKwTROpmgjNk1WgCP+PI5nRjJejtxQ7tx8BmeKRbJE=;
	b=Iof23JAm0IXhXzTshjIDnhB8yvKH/BDvnGutd0lrAk8Zro/f8G0ejaN9xfUE1vYPoV
	C9MQEDuvBNn8/+dTW9EHJApLUbMW+ygfnlAaceTgTNCFWer1+cTCTxYQlqK1liv3OhbL
	Af+XDbfkcHKaGmVE6ul3ofNBcbqdw7tw9VgT0=
Received: by 10.112.47.225 with SMTP id g1mr8549752lbn.52.1329858754362; Tue,
	21 Feb 2012 13:12:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 21 Feb 2012 13:12:04 -0800 (PST)
In-Reply-To: <1329828457-23375-1-git-send-email-noor_ahsan@mentor.com>
References: <1329828457-23375-1-git-send-email-noor_ahsan@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2012 13:12:04 -0800
Message-ID: <CAMKF1sof5d-kmGrbEBqdheawFULL3YkEgpoRXv7+UFKYwxFOjQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libedit: Adds version 20110802 (initial recipe)
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
X-List-Received-Date: Tue, 21 Feb 2012 21:20:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2012 at 4:47 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
>
> +Upstream-Status: Inappropriate [not author]

hmm thats interesting. We can still push patches upstream with proper
attribution to author.
therefore this may not be a reason to make it Inappropriate.


