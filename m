Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QWm4n-0003bC-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 11:07:53 +0200
Received: by bwz5 with SMTP id 5so333510bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=CGEqE9XExyDcy0Gpj9CQQ5T9Sfy/L2Ipuaw48Jcmogc=;
	b=DuVgRWajTI+w/gvzUMw5Y97xlsPsTkkgoSvY3WqXZ8V8+wbI6LboCTzMvMv/h4atST
	8QOVvZL7ij3Hr/bSz8T18wm17iXsNtDFg8G6dcMse12lYwls9gq4uSioBs2gB3Qr1NNY
	kAAjp9QbTTYFHRWzIimfus+HyV1n2S6+QetbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=ukbVcT5GybQ2SbMJlifmkj/JUa3RjFQAq+l6yaAoQgFTwpo7YUWq1KIECVobd+ZFR7
	zBhcJSmur3sb/PIzDQCRAioTa83QLbW0HdW7q7hO6tvj3cEWqdZmM+rf7fFwVyEnLJHm
	q093lB7HJJUNyx74kURcSvChjHeyEUDQgIisw=
Received: by 10.204.141.146 with SMTP id m18mr281832bku.25.1308128667682;
	Wed, 15 Jun 2011 02:04:27 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id k10sm238427bkq.10.2011.06.15.02.04.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 02:04:27 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Wed, 15 Jun 2011 11:04:22 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110615110422.128307b8@guibc>
In-Reply-To: <1308128099.25285.1321.camel@phil-desktop>
References: <guillaume.beraudo@belledonne-communications.com>
	<1308127322-5248-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<1308128099.25285.1321.camel@phil-desktop>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH v2] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Wed, 15 Jun 2011 09:07:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > +/home/guillaume/dev/linphone-embedded/oe/files/igep0020
> > \ No newline at end of file
> 
> Er?  That patch doesn't look quite right to me.

Thanks Phil, I send updated patch.


