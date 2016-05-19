Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 428846067C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 14:01:00 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id w36so43600372qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=KLz7kZSldO3ms2OxG3X9j8ExP9bXdjXZ/KZsqrPyJps=;
	b=qOzdjUG1t8rC0ZforeAiOgLdHWcCzM33mi7Uok9H682vQNr9XloVIlNKWS/ADT5Ijy
	jm9e0TkHTITifxcardgB6EH84Kc1gThdli2+PpSvUJr9OL+lLorYMfUPs3ZXucVUvBw3
	koC7S8TU+sXkvsrVET3PPiGceFRxqxu+aoaywin5/w6yfPDVwYu+vnRESUaJHB3xxY3Z
	kPOXSUJwccAtpYN71VR1+bFpzDCCBddnNwmUf4XrHqU14le4J3Izd6pfNMOjJMugDBZr
	tQZnX7tl7TrDhDe6aKY97xVLBeHIqgkkTQ2+7SLNoCxePI9tV0eI+y6dqQrMgWstyGKB
	AZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=KLz7kZSldO3ms2OxG3X9j8ExP9bXdjXZ/KZsqrPyJps=;
	b=MbpWMeqWFPKM4SBN0nc/GE+7gKF6RzmQsFA9nhrUOjZfobVY3CqYY4MlpXw+9O2Bmj
	qIQaDN52/guf8f9Mgw+J8NGJXQZ9ZStPHlYM30Ob5cxadTK5NTfMTJpBTeVZYXxwZ7pm
	1P8+INyccI+FQqSs/wOzp15VrAHV3T/58o0t3JmnCEg4oIDmXoJHbJlllrpa6XfkIQ+N
	HaZpJMPa1bJta3vKwxhriI8qxq7SRhKYU6kub08D/ae5/t1k3RFXgaueZeRYwe4Hfgyx
	L4/J5lM/Gj415OdcO5AwXKT/8cute4AHIZCEuAxBXkbape7PnRqHMV4mDYweAKsgqyCR
	sr6A==
X-Gm-Message-State: AOPr4FWzFDk3jNjlEjKps3hTHIQTCDdlmvbES//94d2eA77r2tgWNxqiOjw5Kn96R5kWMA==
X-Received: by 10.140.91.194 with SMTP id z60mr13751385qgd.70.1463666461149;
	Thu, 19 May 2016 07:01:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:75c6:5f62:896b:6df7?
	([2601:202:4000:1239:75c6:5f62:896b:6df7])
	by smtp.googlemail.com with ESMTPSA id
	g201sm6701496qke.6.2016.05.19.07.00.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2016 07:01:00 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573DC719.8040001@gmail.com>
Date: Thu, 19 May 2016 07:00:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: jethro-next merge
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
X-List-Received-Date: Thu, 19 May 2016 14:01:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Please merge jethro-next to jethro

- armin

