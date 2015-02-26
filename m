Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id C27AC605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 14:31:44 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id h3so8719882qgf.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=+kpkSoy6bVM8Vo7seO0tqwby/JMGYzUjc1umDpG1M0g=;
	b=rv+zxwF20NH1NAJFZCIjYoMI+6pbVvQTKB5EFkAzIf9wLzeACIFX9QvoigqJBrWiz+
	IPDyexL6Lcm2rgMXasiWEPU1PBAPHOIWqOEAMQjJ3NvQohBcsTE/AwVGuHPTcEjnsa3T
	Tt/WzJgnA0haO8n7FrwCsxHXGujJzEcSCvOcg7F6srY9HDb/Njc1GxjMw8PEu+fI5e2/
	kDr4fleYLo0YzjL9aYZlsehs6QeV+feyNDhzXPhr8Fy8RGoigwCdA6OSg0BvK6VsnyxL
	3sELd9Z7YHgKyBrFu58thih0U/yd3dYUjkf76+xKdIA9BlVLc6TyRQWDL7pQf51UBjs+
	mCoA==
MIME-Version: 1.0
X-Received: by 10.140.105.97 with SMTP id b88mr18091535qgf.94.1424961105844;
	Thu, 26 Feb 2015 06:31:45 -0800 (PST)
Sender: cliff.brake@gmail.com
Received: by 10.140.109.227 with HTTP; Thu, 26 Feb 2015 06:31:45 -0800 (PST)
Date: Thu, 26 Feb 2015 09:31:45 -0500
X-Google-Sender-Auth: OGygcYO2WPnkjkd21G7PKZjIDFc
Message-ID: <CAOd_LFwt57hC7kxYeNA2bY-pLkJcJBZ5c2w9LZxxE1CxvCJ06g@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: building 32-bit SDK on 64-bit machine?
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
X-List-Received-Date: Thu, 26 Feb 2015 14:31:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Does anyone know if its possible to build a 32-bit SDK on a 64-bit
workstation in OE?

Thanks,
Cliff

