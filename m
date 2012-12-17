Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tka15-00080T-2F
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 13:41:55 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 04:27:13 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so8039501ghb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=7feuQ4GC6wl4wi8/hQrQIluVAcqK6mHoki9T6k79Dfs=;
	b=Gb45F9Mofl9qCubokZiX6JIzAouGFtvCe8JfeC2uREsLgjJqoGwVdFQViUkGbMYvQG
	QYSbjzoxma67/9TksfIUDCfYGobmU/AjAbWS3xxXvnzBvYUxPoHx6YxJ4tkSk7QdI8F9
	2SE9bsKXUdF29w36/bfoSRQQ9wL1fkt2jMXPixMGb3gEPK2wd/8Dn6W1Pw3Q7LC46o9B
	c4fSIkMkwOqoLDXaEjTDkfzAjqcIGkjsr6GBECf1AcJfV19Ilkg15C1YZOUUhKNxljrw
	dv3jSppggU2WajQJw7xdXZTcj5Vc50ZQhVQTvrqHMoIg/ipkMoHtNLDyWGVCXYPdKSlq
	l38g==
Received: by 10.52.37.9 with SMTP id u9mr19860318vdj.83.1355747232081;
	Mon, 17 Dec 2012 04:27:12 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr19860310vdj.83.1355747232012; Mon, 17
	Dec 2012 04:27:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 04:26:50 -0800 (PST)
In-Reply-To: <20121217113848.GH3448@jama>
References: <1355741439-13106-1-git-send-email-ross.burton@intel.com>
	<20121217113848.GH3448@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 12:26:50 +0000
Message-ID: <CAJTo0LZu+cWwfLDcx8rbdLTwJAD60-V5V6P-hi3fO=eXy=sr1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn1mmQ7k9gwsZC0msGs94tgVaPq+tBz18KUDJeOWYOjhgqeY2AtTFegk6tuvMjZYCzz8tDiZm6aW40qftaXGJdHvhAuAbhHrg3yeSYWwPg0EKXeZD8vVVeWQBUZVVpGwHyHa59zkz6TiBkVNJ9JqKQ9jq3WP5Ml7uoX8V36f3SHo73FTSLXzjF0S2hGdg8nrbHEQohI
Subject: Re: [meta-multimedia PATCH] gst123: add package
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
X-List-Received-Date: Mon, 17 Dec 2012 12:41:55 -0000
Content-Type: text/plain; charset=UTF-8

On 17 December 2012 11:38, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +# This is actually the commit after 0.3.1 which fixes a display bug
>> +SRCREV = "3e46d2e501da68d929bb5f26900a292a5fc04a1f"
>
> Why not show it in PV and name recipe gst123_git.bb?

In hindsight just using tarball+patch is a lot simpler.  V2 sent.

Ross


