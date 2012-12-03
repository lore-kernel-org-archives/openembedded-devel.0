Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfaeP-0003o2-Ht
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 19:21:54 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so4547489ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=y2LCcNWNkwkFt/yLMBZEu/l0vqGH/AtMgyza+2gkiUs=;
	b=DdYCIwQsODmc8jBDyqQCZMGXgtIIThpCo44ewMttU32t9zaAJREaTYHLT9QPP5Bju2
	HBMt3OE51ZhuIoWa6siSHKLk9XDDZKyZgOZBJC1YrjaAjOF9N/Pj7lBLu1l+knDN/kld
	gyh3VuH4r67vuN7Z9LWhSvRACaWMVUBHPFQXikeB1ui8EKKzlwSjqbd8PkAU7wlY7woa
	9vGLyFdTRqnZz/s7g1wMbS34yniOffJ1L1rjvvO2dfp1ouKnubJ2/oKmGOv5/eWeBYKd
	BrIfy1yRNbkKXz1FUkdYXRb1d9OmJqjFY/jsLkSxUmMMcYaP5IBesZwDuzT1B+461KSl
	ItmA==
Received: by 10.50.163.99 with SMTP id yh3mr7292024igb.29.1354558051599;
	Mon, 03 Dec 2012 10:07:31 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id eo7sm8249518igc.12.2012.12.03.10.07.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 10:07:30 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <1354554250-12014-1-git-send-email-mario@ossystems.com.br>
	<CAJTo0LY2xvYBZYVzeze3ZkGSra=AJaDO9L2koB3oxOn0CbN9Gg@mail.gmail.com>
Date: Mon, 03 Dec 2012 12:54:36 -0500
In-Reply-To: <CAJTo0LY2xvYBZYVzeze3ZkGSra=AJaDO9L2koB3oxOn0CbN9Gg@mail.gmail.com>
	(Ross Burton's message of "Mon, 3 Dec 2012 17:57:34 +0000")
Message-ID: <85zk1vc97n.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: explicitly set --with-database=simple
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
X-List-Received-Date: Mon, 03 Dec 2012 18:21:55 -0000
Content-Type: text/plain

On Mon, 3 Dec 2012 17:57:34 +0000 "Burton, Ross" <ross.burton@intel.com> wrote:

> This should be sent to oe-core, not oe-devel.

Thanks for the heads-up, Ross.  I've sent the patch to oe-core.  Sorry
for the noise.

Best wishes.
Mario


