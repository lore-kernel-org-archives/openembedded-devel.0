Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dbaryshkov@gmail.com>) id 1Impuq-0008PC-7K
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 13:09:52 +0100
Received: by py-out-1112.google.com with SMTP id a25so4108216pyi
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2007 05:09:47 -0700 (PDT)
Received: by 10.65.153.10 with SMTP id f10mr15088735qbo.1193739652542;
	Tue, 30 Oct 2007 03:20:52 -0700 (PDT)
Received: by 10.64.233.15 with HTTP; Tue, 30 Oct 2007 03:20:52 -0700 (PDT)
Message-ID: <bc64b4640710300320h63a90f80tc9ceca9d4340e994@mail.gmail.com>
Date: Tue, 30 Oct 2007 13:20:52 +0300
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: webwide@rpsys.net, dirk@do13.de
Subject: Update Tosa kernel patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2007 12:09:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I've updated Tosa patchset to support recent kernels (linux-rp-2.6.22,
linux-rp-2.6.23).
There is still no support for usb host controller (so no built-in
wireless), but I'm working on it :)

-- 
With best wishes
Dmitry Baryshkov


