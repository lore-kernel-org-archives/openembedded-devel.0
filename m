Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHcHS-0005NV-6p
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 16:42:50 +0200
Received: by pbcum15 with SMTP id um15so40378pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4GITRZKcv6ivQr7qd/aDcys/ApSjQcQCY/IUIMSlz1w=;
	b=eVZ4XPokkuBavSipozNctrLC5DIOEO4DI7JuI3ofUzTVMCSpb36jDU3G5h2luowu74
	dVbpjn+qZ0Er9DI09gx/oX5sZFK9pCMaYi2fczNBsiw7n1xwp9suNoAuW3q/85lnHrc6
	UhEJOvsISuSvaIsooEnYmuZcQvbZpn92kcNTLQKEgpVOqa6o2rMl6YEKCcNOk0e7BEBX
	c6fDgBVBJjWzfQYGqvCEkaVCSU306QGzwlsqsS70xseEE6EoecbvwoKQm0bf+0UtFhJ3
	AjhhWwAZExEOW8cXVuq4uN6RfmqyyfwHFCgJEEW2b5Kx3YhhNLnQgRRtg0RgvoEoGrFs
	39zw==
MIME-Version: 1.0
Received: by 10.68.218.198 with SMTP id pi6mr29782620pbc.100.1334068411524;
	Tue, 10 Apr 2012 07:33:31 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Tue, 10 Apr 2012 07:33:31 -0700 (PDT)
In-Reply-To: <1334013627-10533-1-git-send-email-andrea.adami@gmail.com>
References: <1334011736-9053-1-git-send-email-andrea.adami@gmail.com>
	<1334013627-10533-1-git-send-email-andrea.adami@gmail.com>
Date: Tue, 10 Apr 2012 16:33:31 +0200
Message-ID: <CAAQYJAs1049A9Re12=8925Y12eEQ=oCt6wA-OepbqEzSxFwJoQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH v2] Initial commit of linux-yocto-tiny_3.2 for Zaurus
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
X-List-Received-Date: Tue, 10 Apr 2012 14:42:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Patch v3 will follow later this evening

* Fixes:
* missing KMACHINE_spitz = "spitz in linux-yocto-tiny
* refactored linux-yocto-tiny recipe (remove LOGO_SIZE variable),
explicit overrides per-machine

Sorry for the noise...

Regards
Andrea


