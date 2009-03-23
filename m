Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Llf9a-00008q-5S
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:05:02 +0100
Received: by qyk30 with SMTP id 30so2338432qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:date:message-id:x-mailer;
	bh=pzX+ILwPXAFvr0FjrcCaTl2roCCsowxKRpj6VuFfosk=;
	b=uTrLEZaQCR/bRbbVjxEenKYdFFejyne/VFn3jPp3knzJPTyJGpJ0aA5rw/92NF1A2F
	9W+uVP4kLeKCSDL3tv2f1Ff63BH7AiJ8sSVnvE+5D07tAxoko7OxcUS/BH9VCbyVipST
	Lgw8RHM/MEPlkiKzu6uX2X9Ew9mUasYSGKhI4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=Ih1NhR0sDhsB/rKI2DyeYuCeEH1UyhDlKr9rokg2U9RIdOp2X2MZzo1GwYDfqQscCn
	PCG3QCH5XyhBX2Njksa9G2ZGckEJtyCMnmCjjJq1rDmv9PogRH40VOh1rDqLt7QQK2Hv
	Ykfx/o2zOyU8LfZGd1GR4Ib/jLAPdAd5h/yc0=
Received: by 10.224.20.17 with SMTP id d17mr8477689qab.38.1237795418305;
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm8987967ywf.16.2009.03.23.01.03.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:03:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id AF4626100E1; Mon, 23 Mar 2009 05:03:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 05:03:26 -0300
Message-Id: <1237795409-8884-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.2.1.303.g63699
Subject: Firefox related improvements
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
X-List-Received-Date: Mon, 23 Mar 2009 08:05:04 -0000

Hello,

Since we're going to use Firefox in our system we've made few
improvements on it to allow the usage of translations. During it, we
also found that it wasn't disabling the application updating as done
in most distributions and then we've fixed it as well.

Please ack/nack it.



