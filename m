Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88785607A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 19:16:25 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id w68so7202063pgw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 11:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=E1nbZ7GbSUmdZR2ORoTiL+9O9HpDf9X491CkOeRUcZc=;
	b=LZ2I8s+7GKbTUuZK73CEeKT0rfiloA1W2uXoMcY6mHoPSPTlj8uMj1OCvt3Fmg+alI
	flMP5FRi+1RHoUXlei8bu3t4OUqG+Xv8ruWDG8U3ZAaUTcW4zY72CtJC5hK62zFy4e/H
	eYLHpQbHCkmdjYkASA3Dw2uQN9k/qhSKBUJaHhJCYHX2NFllxgKZWRg6QoefChRZA9/D
	U9O2FGNoDxLw6HsynTwKVMHgOtyYvZu4BHp2BL49HOj2mmDOLZ0hyhNSDKEI80y77bUj
	6EgJnzavPQzV2ihfbY3rqDvnkkLpaOSzE3K+vXBnJwNzsEJMggkH0BB+6Ug7GpbrFrwl
	BWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=E1nbZ7GbSUmdZR2ORoTiL+9O9HpDf9X491CkOeRUcZc=;
	b=ZbCzzNYThkpq+xPquYvZNqG2TkKmEmm3ia6aFkGuhFHBbU5V0Mi2I80+t3lTRIwjls
	58s6O4ifQNtIkmTuzaFmVri5/d7fZ4wNBgKhgZ40K+3Ab6XOP+f4Ll9tBvyA8cK6CkeA
	pTap4wa+DpRVaeIGJl4bmL9y5fUvWwr6Vb1269+dPwBFFPvITz9sA8ZIcKBLfhBDUQBu
	QtY8/1hdzyLkcB+MX7i5Tlb6evQJOBOdk5PWWiQQwznik3DYB51QzK1rNpnxh2WZVr0B
	+ZfBgksfQppeoP+wNP7e58AvSfttL65C6lsrP0pMY5PE2o7KyhXGflSgACemnYLdCGUc
	BRfg==
X-Gm-Message-State: AIkVDXJmGbh8nk5w0dGPXSQHEk8PqoQXCt2RNJKkYW2VSvCgyp+WLJGxkU317QDQmzvzOg==
X-Received: by 10.98.7.151 with SMTP id 23mr735635pfh.5.1482261387274;
	Tue, 20 Dec 2016 11:16:27 -0800 (PST)
Received: from ?IPv6:2601:647:4c00:23ec:d91a:25a3:ce34:6bad?
	([2601:647:4c00:23ec:d91a:25a3:ce34:6bad])
	by smtp.gmail.com with ESMTPSA id
	w125sm40949216pfb.8.2016.12.20.11.16.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 11:16:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Tue, 20 Dec 2016 11:16:25 -0800
References: <CAHQecY48gVbt4S+88MHivSbv-Xdn29WRq5RPL6+QDVGYUPCwYw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAHQecY48gVbt4S+88MHivSbv-Xdn29WRq5RPL6+QDVGYUPCwYw@mail.gmail.com>
Message-Id: <E628426E-84F8-4EA4-A296-D32C3339DF1C@gmail.com>
X-Mailer: Apple Mail (2.3259)
Subject: Re: Infra Full Stop 12/26-12/29
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 19:16:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Dec 20, 2016, at 10:50 AM, Tom King <ka6sox@gmail.com> wrote:
> 
> Hi All,
> 
> We have been looking for a time when we could do a full stop of the infra
> to upgrade some bits and clear out some faults.
> 
> This will involve shutting down the main machine that we use for *most* of
> the OE infra.
> 
> Our goal is to put up a backup git master but other services such as: wiki,
> patches, etc will be offline for some or all of that period.
> 
> We have delayed doing this much needed maintenance to try to work around
> Yocto and OE release schedules and it is necessary that we take this time
> to do the work.
> 

I guess, you need to come up with a tentative down-time schedule. 

> Tom
> (for the OE Infra Team)
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


