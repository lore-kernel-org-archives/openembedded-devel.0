Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 88166789D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 06:23:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520058214; h=Content-Type: To: Subject: Message-ID: Date:
	From: MIME-Version: Sender;
	bh=4FLV52yiwoqx8411Lo8zkKfDC+Kelgx+erIjMEIFC2I=;
	b=SNZWPUNttdharvYoachaRrrkujhA9+GOwAVwMbS6rtlKxGJwKPl6Fbb6CxHFdznWERPiUfb6
	o/ESxorqh7/T9xjCBFOz7D8Rcr/Mbqx7K5DL/v/vMDf6nph64U4kRvzAW3gwysED9i5gB+9h
	esQnOc+59SB7mf6hVqalddA9hzA=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mxa.mailgun.org with ESMTP id 5a9a3f66.7f22b06836f0-smtp-out-n01;
	Sat, 03 Mar 2018 06:23:34 -0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id d206so14736814qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 22:23:34 -0800 (PST)
X-Gm-Message-State: AElRT7HMNlXZ6HPS9nMvA7ZqSZaVr5u1ynpFRlfu4gpLDKUxnxXurTF0
	8yglFxk8qaNM6TaYvtvsiHaR4xfinlJoex9AraU=
X-Google-Smtp-Source: AG47ELs/yvPNQYDOZGn5ndJXB/R/uGuI2P4oyuCL+jQE/M+oJ8w2BPOwXXQt/9FRo0AoktKJBn4UNGPKb2lYdy5toWs=
X-Received: by 10.55.27.27 with SMTP id b27mr11462758qkb.19.1520058213865;
	Fri, 02 Mar 2018 22:23:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 22:23:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
Date: Sat, 3 Mar 2018 01:23:33 -0500
X-Gmail-Original-Message-ID: <CADNbA1qz1NORDroqdVZ1tRKGywq0-_1he3sC5jA-mnJ9_5xo2A@mail.gmail.com>
Message-ID: <CADNbA1qz1NORDroqdVZ1tRKGywq0-_1he3sC5jA-mnJ9_5xo2A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-webserver]
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
X-List-Received-Date: Sat, 03 Mar 2018 06:23:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm currently looking to remove divest maintaining meta-oe layers.  Is
there anyone in the community interested in maintaining meta-webserver?
Feel free to submit a patchset removing me and I'll ack it.  Thanks.

-Derek

