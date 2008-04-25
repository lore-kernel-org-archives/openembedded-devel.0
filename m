Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1JpSyw-0006NF-Kh
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 20:49:14 +0200
Received: by ug-out-1314.google.com with SMTP id i24so150047ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2008 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
	bh=cebpEsr8HCiUpYfURdB1TAuxd+58Z7P/t9Xxi6rqc38=;
	b=DMFcUNQpjtnUKxQ6f/JgHzC3QUSMU+vsRQhzX2dqR1GsHg551b311joN/Jd/1F1DF3586A8s2qC5Rubnuw04Ev4s6pNenrU+ZHj8vUZ2S6yPG9oGieSkr5n6egtqyPRMq5JY//ijazjc085VNHPrtsDWHip9qhnQTwKuEvPaEqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=u9Umz6XkadZIGk+MZzhrB5Y5kKze12mTzBjM3UHa4Q1ZNYBHYEo5ySiKAbXLFi//ilmXa6fB5pGfNZm8VJVSvJRwiNnsdc3dfGivr7ww2g5/NQFuFW/ExDgM3cS45XAKbs3iO+tuhfOuDNrfhNo3Jf8eQPVfqaEu6oCdKgXhwGE=
Received: by 10.66.239.16 with SMTP id m16mr586316ugh.28.1209149340208;
	Fri, 25 Apr 2008 11:49:00 -0700 (PDT)
Received: by 10.67.25.4 with HTTP; Fri, 25 Apr 2008 11:49:00 -0700 (PDT)
Message-ID: <a7f8874a0804251149w4d740b1ftc40e41703de334da@mail.gmail.com>
Date: Fri, 25 Apr 2008 11:49:00 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.10b4
Subject: OE on Ubuntu 8.04?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 18:49:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Now that Ubuntu 8.04 has been released, I would like to upgrade my build
laptop. I was wondering if anybody has had any experience with 8.04 and
knows of any OE specific pitfalls to watch for. Thanks,

-- 
Henry von Tresckow (hvontres)

