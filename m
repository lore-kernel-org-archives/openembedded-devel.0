Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLZCg-00019q-LE
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:37:27 +0100
Received: by fxm8 with SMTP id 8so3646fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 02:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=d0lrS4k389lJ+yNnxtTpEnQWuW9xFA8QQzMnsu9tkC0=;
	b=E+I1om8wcFGJH8oMSU84yQFh+rXOeTD81YvqULjGcMChEx8w2SP4QtELIytxZ6qHcI
	kppiT+s4E3Rh/TLdCqTQS7iu3jb4Aevix4ju9Ng7YLXIEVWf3ZyTc33zF1WxU1wtf3GS
	wSk7bNbDNEjMLkWVTz5NRAAlfz9hOU5VkHDxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=wrvc1cwioSRxtfMgFhxw8Y87ScMwiGlbyy0lrpdS7jLKdGhbAogIbfQm94ry9uhhDU
	Y7GtsViZFUe4I+GJnvn5GkT1R7JoQajZCinSh1iZOz4o5yK/rOVNsDBGXNRzZbwD+sjo
	Yel0J75hKf/VTviD5wrchmZkpZ1Qgjxwu4eYI=
Received: by 10.223.83.133 with SMTP id f5mr556625fal.29.1290681371812;
	Thu, 25 Nov 2010 02:36:11 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l14sm135697fan.9.2010.11.25.02.36.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 02:36:10 -0800 (PST)
Date: Thu, 25 Nov 2010 11:35:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125103559.GM3274@jama>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
	<1290676461-13283-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290676461-13283-4-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/5] busybox-static: switch to 1.17.4
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
X-List-Received-Date: Thu, 25 Nov 2010 10:37:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 10:14:20AM +0100, Eric Bénard wrote:
> before removing busybox-1.17.3
> 

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


